part of 'menu_bloc.dart';

abstract class HeaderMenuEvent {}

  class LoadHeaderMenuList extends HeaderMenuEvent {
  final int page;
  LoadHeaderMenuList(this.page);
}

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
