import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthenticateUser extends AuthEvent {
  final String username;
  final String password;

  const AuthenticateUser(this.username, this.password);

  @override
  List<Object> get props => [username, password];
}

class FetchUserData extends AuthEvent {
  const FetchUserData();

  @override
  List<Object> get props => [];
}
