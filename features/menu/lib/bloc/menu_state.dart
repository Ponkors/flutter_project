part of 'menu_bloc.dart';

class MenuState {
  final bool isLoading;
  final List<MenuItemEntity> dishesList;
  final List<HeaderMenuItemEntity> headerImagesList;
  final List<HorizontalMenuItemEntity> horizontalDishesList;
  final Object? error;

  const MenuState({
    this.isLoading = true,
    this.dishesList = const [],
    this.headerImagesList = const [],
    this.horizontalDishesList = const [],
    this.error,
  });

  MenuState copyWith({
    List<MenuItemEntity>? dishesList,
    List<HeaderMenuItemEntity>? headerImagesList,
    List<HorizontalMenuItemEntity>? horizontalDishesList,
    bool? isLoading,
    Object? error,
  }) {
    return MenuState(
      dishesList: dishesList ?? this.dishesList,
      headerImagesList: headerImagesList ?? this.headerImagesList,
      horizontalDishesList: horizontalDishesList ?? this.horizontalDishesList,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
