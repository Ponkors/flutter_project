part of 'menu_bloc.dart';


abstract class DishesEvent {
  const DishesEvent();
}

class InitListOfDishes extends DishesEvent {
  InitListOfDishes();
}

class LoadListOfDishes extends DishesEvent {
  LoadListOfDishes();
}

class CheckInternetConnection extends DishesEvent{
  CheckInternetConnection();
}