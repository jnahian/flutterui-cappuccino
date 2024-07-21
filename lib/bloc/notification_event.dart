import 'package:equatable/equatable.dart';

abstract class NotificationEvent extends Equatable {
  const NotificationEvent();

  @override
  List<Object> get props => [];
}

class FetchNotifications extends NotificationEvent {}

class FetchNotificationData extends NotificationEvent {
  final String id;

  const FetchNotificationData(this.id);

  @override
  List<Object> get props => [id];
}
