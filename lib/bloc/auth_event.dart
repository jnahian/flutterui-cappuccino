import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthenticateUser extends AuthEvent {
  final String email;
  final String password;

  const AuthenticateUser(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class LogoutUser extends AuthEvent {}

class PostPasswordForgot extends AuthEvent {
  final String email;

  const PostPasswordForgot(this.email);

  @override
  List<Object> get props => [email];
}

class FetchUserData extends AuthEvent {
  const FetchUserData();

  @override
  List<Object> get props => [];
}

class FetchUserCoupon extends AuthEvent {
  const FetchUserCoupon();

  @override
  List<Object> get props => [];
}


class FetchBaristaStatus extends AuthEvent {
  const FetchBaristaStatus();

  @override
  List<Object> get props => [];
}
