part of 'menu_bloc.dart';

class MenuState {
  final bool isLoading;
  final List<MenuItemEntity> dishesList;
  final Object? error;

  const MenuState({
    this.isLoading = true,
    this.dishesList = const [],
    this.error,
  });

  MenuState copyWith({
    List<MenuItemEntity>? dishesList,
    bool? isLoading,
    Object? error,
  }) {
    return MenuState(
      dishesList: dishesList ?? this.dishesList,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
