part of 'menu_bloc.dart';

abstract class MenuEvent {}

class LoadMenuList extends MenuEvent {
  final int page;
  LoadMenuList(this.page);
}
