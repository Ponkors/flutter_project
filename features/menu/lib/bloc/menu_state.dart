part of 'menu_bloc.dart';

class DishesState {
  final bool isLoading;
  final List<DishModel> listOfDishes;
  final List<String> categories;
  final List<DishModel> dishesOfEnteredCategory;
  final Object? exception;
  final bool? haveInternetConnection;

  DishesState({
    this.isLoading = true,
    this.listOfDishes = const [],
    this.categories = const [],
    this.dishesOfEnteredCategory = const[],
    this.exception,
    this.haveInternetConnection,
  });

  DishesState copyWith({
    bool? isLoading,
    List<DishModel>? listOfDishes,
    List<String>? categories,
    List<DishModel>? dishesOfEnteredCategory,
    Object? exception,
    bool? haveInternetConnection,
  }) {
    return DishesState(
      isLoading: isLoading ?? this.isLoading,
      listOfDishes: listOfDishes ?? this.listOfDishes,
      categories: categories ?? this.categories,
      dishesOfEnteredCategory:
        dishesOfEnteredCategory ?? this.dishesOfEnteredCategory,
      exception: exception ?? this.exception,
      haveInternetConnection:
        haveInternetConnection ?? this.haveInternetConnection,
    );
  }
}