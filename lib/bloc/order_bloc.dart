// lib/bloc/Order_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/api_service.dart';
import 'order_event.dart';
import 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final ApiService apiService = ApiService();

  OrderBloc() : super(OrderInitial()) {
    on<FetchOrders>(_onFetchOrders);
    on<PostOrder>(_onPostOrder);
    on<FetchOrderData>(_onFetchOrderDetails);
    on<FetchPendingOrders>(_onFetchPendingOrders);
    on<CancelOrder>(_onCancelOrder);
  }

  Future<void> _onPostOrder(PostOrder event, Emitter<OrderState> emit) async {
    emit(OrderLoading());
    try {
      final response = await apiService.postRequest('/order', {
        'menu_id': event.id,
        'note': event.instruction,
        'guest': event.guest,
      });
      emit(OrderSuccess(response['message']));
    } catch (e) {
      emit(OrderError(e.toString()));
    }
  }

  Future<void> _onFetchOrders(FetchOrders event, Emitter<OrderState> emit) async {
    emit(OrderLoading());
    try {
      final response = await apiService.getRequest('/order');
      emit(OrderLoaded(response['data']['orders']));
    } catch (e) {
      emit(OrderError(e.toString()));
    }
  }

  Future<void> _onFetchOrderDetails(FetchOrderData event, Emitter<OrderState> emit) async {
    emit(OrderLoading());
    try {
      final response = await apiService.getRequest('/order/$event.id');
      emit(OrderLoaded(response['data']['order']));
    } catch (e) {
      emit(OrderError(e.toString()));
    }
  }

  Future<void> _onFetchPendingOrders(FetchPendingOrders event, Emitter<OrderState> emit) async {
    try {
      final response = await apiService.getRequest('/orders/pending');
      emit(PendingOrderLoaded(response['data']['orders']));
    } catch (e) {
      print(e);
      // emit(OrderError(e.toString()));
    }
  }

  Future<void> _onCancelOrder(CancelOrder event, Emitter<OrderState> emit) async {
    emit(OrderCancelling());
    try {
      final response = await apiService.postRequest('/order', {
        'menu_id': event.id,
      });
      emit(OrderCancelled(response['message']));
    } catch (e) {
      emit(OrderError(e.toString()));
    }
  }
}
