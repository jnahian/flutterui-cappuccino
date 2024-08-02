// lib/bloc/Menu_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/api_service.dart';
import 'menu_event.dart';
import 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final ApiService apiService = ApiService();

  MenuBloc() : super(MenuInitial()) {
    on<FetchMenus>(_onFetchMenus);
    on<FetchMenuData>(_onFetchMenuDetails);
  }

  Future<void> _onFetchMenus(FetchMenus event, Emitter<MenuState> emit) async {
    emit(MenuLoading());
    try {
      final response = await apiService.getRequest('/menu');
      emit(MenuLoaded(response['data']['menus']));
    } catch (e) {
      emit(MenuError(e.toString()));
    }
  }

  Future<void> _onFetchMenuDetails(FetchMenuData event, Emitter<MenuState> emit) async {
    emit(MenuDetailsLoading());
    try {
      final response = await apiService.getRequest('/menu/${event.id}');
      emit(MenuDetailsLoaded(response['data']['menu']));
    } catch (e) {
      emit(MenuError(e.toString()));
    }
  }
}
