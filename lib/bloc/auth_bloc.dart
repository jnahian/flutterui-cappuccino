import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localstorage/localstorage.dart';
import '../services/api_service.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final ApiService apiService = ApiService();

  AuthBloc() : super(AuthInitial()) {
    on<AuthenticateUser>(_onAuthenticateUser);
    on<LogoutUser>(_onLogoutUser);
    on<FetchUserData>(_onFetchUserData);
    on<FetchUserCoupon>(_onFetchUserCoupon);
    on<PostPasswordForgot>(_onPostPasswordForgot);
    on<FetchBaristaStatus>(_onFetchBaristaStatus);
  }

  Future<void> _onAuthenticateUser(AuthenticateUser event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final response = await apiService.authenticateUser(event.email, event.password);
      // print(response);
      localStorage.setItem('token', response['data']['token']);
      emit(Authenticated(response['data']['token']));
      emit(UserDataLoaded(response['data']['user']));
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(Unauthenticated());
    }
  }

  Future<void> _onLogoutUser(LogoutUser event, Emitter<AuthState> emit) async {
    try {
      final response = await apiService.logout();
      print('Logout respons: $response');
      localStorage.removeItem('token');
      emit(Unauthenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onPostPasswordForgot(PostPasswordForgot event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final userData = await apiService.postRequest('/forgot-password', {'email': event.email});
      emit(UserDataLoaded(userData));
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
      emit(Unauthenticated());
    }
  }

  Future<void> _onFetchUserCoupon(FetchUserCoupon event, Emitter<AuthState> emit) async {
    try {
      final body = await apiService.getRequest('/coupons');
      emit(UserCouponLoaded(body['data']));
    } catch (e) {
      print(e);
      // emit(AuthError(e.toString()));
    }
  }

  Future<void> _onFetchBaristaStatus(FetchBaristaStatus event, Emitter<AuthState> emit) async {
    try {
      final body = await apiService.getRequest('/barista-status');
      emit(MaintananceStatusLoaded(body['is_maintenance']));
      emit(BaristaStatusLoaded(body['data']['status']));
    } catch (e) {
      emit(const BaristaStatusLoaded(false));
      print("Barista status error: $e");
      // emit(AuthError(e.toString()));
    }
  }
}
