// lib/bloc/Notification_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/api_service.dart';
import 'notification_event.dart';
import 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final ApiService apiService = ApiService();

  NotificationBloc() : super(NotificationInitial()) {
    on<FetchNotifications>(_onFetchNotifications);
  }

  Future<void> _onFetchNotifications(FetchNotifications event, Emitter<NotificationState> emit) async {
    emit(NotificationLoading());
    try {
      final response = await apiService.getRequest('/notifications/previous');
      emit(NotificationLoaded(response['data']['notifications']));
    } catch (e) {
      emit(NotificationError(e.toString()));
    }
  }
}
