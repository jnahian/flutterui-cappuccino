import 'package:equatable/equatable.dart';

abstract class MenuEvent extends Equatable {
  const MenuEvent();

  @override
  List<Object> get props => [];
}

class FetchMenus extends MenuEvent {}

class FetchMenuData extends MenuEvent {
  final String id;

  const FetchMenuData(this.id);

  @override
  List<Object> get props => [id];
}
