part of 'menu_bloc.dart';

abstract class HorizontalMenuEvent {}

class LoadHorizontalMenuList extends HorizontalMenuEvent {
  final int page;
  LoadHorizontalMenuList(this.page);
}

abstract class MenuEvent {}

class LoadMenuList extends MenuEvent {
  final int page;
  LoadMenuList(this.page);
}
