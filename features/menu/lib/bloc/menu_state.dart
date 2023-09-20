part of 'menu_bloc.dart';

class DishesState {
  final bool isLoading;
  final List<DishModel> listOfDishes;
  final Object? exception;
  final bool haveInternetConnection;

  DishesState({
    this.isLoading = true,
    this.listOfDishes = const [],
    this.exception,
    this.haveInternetConnection = true,
  });

  DishesState copyWith({
    bool? isLoading,
    List<DishModel>? listOfDishes,
    Object? exception,
    bool? haveInternetConnection,
  }) {
    return DishesState(
      isLoading: isLoading ?? this.isLoading,
      listOfDishes: listOfDishes ?? this.listOfDishes,
      exception: exception ?? this.exception,
      haveInternetConnection:
        haveInternetConnection ?? this.haveInternetConnection,
    );
  }
}