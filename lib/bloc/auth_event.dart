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

class FetchUserData extends AuthEvent {
  const FetchUserData();

  @override
  List<Object> get props => [];
}
