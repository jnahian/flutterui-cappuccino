import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localstorage/localstorage.dart';
import '../services/api_service.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final ApiService apiService = ApiService();

  AuthBloc() : super(AuthInitial()) {
    on<AuthenticateUser>(_onAuthenticateUser);
    on<FetchUserData>(_onFetchUserData);
  }

  Future<void> _onAuthenticateUser(AuthenticateUser event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final response = await apiService.authenticateUser(event.email, event.password);
      localStorage.setItem('token', response['data']['token']);
      emit(Authenticated(response['data']['token']));
      emit(UserDataLoaded(response['data']['user']));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onFetchUserData(FetchUserData event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final userData = await apiService.getUserData();
      emit(UserDataLoaded(userData));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
