part of 'menu_bloc.dart';


abstract class MenuEvent {}
class LoadMenuList extends MenuEvent {
  final int page;
  LoadMenuList(this.page);
}

class LoadHeaderMenuList extends MenuEvent {
  final int page;
  LoadHeaderMenuList(this.page);
}

class LoadHorizontalMenuList extends MenuEvent {
  final int page;
  LoadHorizontalMenuList(this.page);
}
