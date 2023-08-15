part of 'menu_bloc.dart';


class CombinedMenuState {
  final List<MenuState> menuState;
  final List<HorizontalMenuState> horizontalMenuState;

  CombinedMenuState(this.menuState, this.horizontalMenuState);
}

class HorizontalMenuState {
  final bool isLoading;
  final List<HorizontalMenuItemEntity> dishesList;
  final Object? error;

  const HorizontalMenuState({
    this.isLoading = true,
    this.dishesList = const [],
    this.error,
  });

  HorizontalMenuState copyWith({
    List<HorizontalMenuItemEntity>? dishesList,
    bool? isLoading,
    Object? error,
  }) {
    return HorizontalMenuState(
      dishesList: dishesList ?? this.dishesList,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}


class MenuState {
  final bool isLoading;
  final List<MenuItemEntity> dishesList;
  final List<HorizontalMenuItemEntity> horizontalDishesList;
  final Object? error;

  const MenuState({
    this.isLoading = true,
    this.dishesList = const [],
    this.horizontalDishesList = const [],
    this.error,
  });

  MenuState copyWith({
    List<MenuItemEntity>? dishesList,
    List<HorizontalMenuItemEntity>? horizontalDishesList,
    bool? isLoading,
    Object? error,
  }) {
    return MenuState(
      dishesList: dishesList ?? this.dishesList,
      horizontalDishesList: horizontalDishesList ?? this.horizontalDishesList,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
