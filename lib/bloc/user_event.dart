import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class FetchUsers extends UserEvent {
  final String token;

  const FetchUsers(this.token);

  @override
  List<Object> get props => [token];
}
