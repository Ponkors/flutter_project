part of 'admin_panel_bloc.dart';

abstract class AdminPanelEvent {
  const AdminPanelEvent();
}

class LoadDishes extends AdminPanelEvent {
  const LoadDishes();
}

class UpdateDish extends AdminPanelEvent {
  final DishModel dishModel;
  const UpdateDish({
    required this.dishModel,
  });
}

class LoadUsers extends AdminPanelEvent {
  const LoadUsers();
}

class UpdateUserRole extends AdminPanelEvent {
  final String role;
  final String uid;
  const UpdateUserRole({
    required this.role,
    required this.uid,
  });
}

class InitOrders extends AdminPanelEvent {
  const InitOrders();
}

class UpdateOrderStatus extends AdminPanelEvent {
  final String uid;
  final bool isReady;
  const UpdateOrderStatus({
    required this.uid,
    required this.isReady,
  });
}

class LoadOrders extends AdminPanelEvent {
  const LoadOrders();
}


class DeleteDish extends AdminPanelEvent {
  final String id;
  const DeleteDish({
    required this.id,
  });
}

class NavigateToBackScreen extends AdminPanelEvent {
  const NavigateToBackScreen();
}

class NavigateToAdminPanelScreen extends AdminPanelEvent {
  NavigateToAdminPanelScreen();
}