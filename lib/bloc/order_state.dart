import 'package:equatable/equatable.dart';

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {}

class OrderLoaded extends OrderState {
  final List<dynamic> orders;

  const OrderLoaded(this.orders);

  @override
  List<Object> get props => [orders];
}

class OrderSuccess extends OrderState {
  final String message;

  const OrderSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class OrderError extends OrderState {
  final String message;

  const OrderError(this.message);

  @override
  List<Object> get props => [message];
}
