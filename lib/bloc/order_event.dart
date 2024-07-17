import 'package:equatable/equatable.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class FetchOrders extends OrderEvent {}

class PostOrder extends OrderEvent {
  final String id;
  final String instruction;
  final bool guest;

  const PostOrder(this.id, this.instruction, this.guest);

  @override
  List<Object> get props => [id, instruction, guest];
}

class FetchOrderData extends OrderEvent {
  final String id;

  const FetchOrderData(this.id);

  @override
  List<Object> get props => [id];
}
