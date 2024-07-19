import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
  final String token;

  const Authenticated(this.token);

  @override
  List<Object> get props => [token];
}

class ForgotPassword extends AuthState {
  final String email;

  const ForgotPassword(this.email);

  @override
  List<Object> get props => [email];
}

class AuthError extends AuthState {
  final String message;

  const AuthError(this.message);

  @override
  List<Object> get props => [message];
}

class UserDataLoaded extends AuthState {
  final Map<String, dynamic> userData;

  const UserDataLoaded(this.userData);

  @override
  List<Object> get props => [userData];
}

class UserCouponLoaded extends AuthState {
  final Map<String, dynamic> userCoupon;

  const UserCouponLoaded(this.userCoupon);

  @override
  List<Object> get props => [userCoupon];
}

class BaristaStatusLoaded extends AuthState {
  final bool baristaStatus;

  const BaristaStatusLoaded(this.baristaStatus);

  @override
  List<Object> get props => [baristaStatus];
}
