part of 'admin_panel_bloc.dart';

class AdminPanelState {
  final List<UserModel> usersList;
  final List<DishModel> dishesList;
  final List<OrdersHistoryUserInfoModel> ordersList;
  final List<OrdersHistoryUserInfoModel> unReadyOrdersList;
  final int numberOfUsers;
  final int salesAmount;
  final bool isLoading;
  final String exception;
  final List<String> categories;

  const AdminPanelState({
    required this.usersList,
    required this.dishesList,
    required this.ordersList,
    required this.unReadyOrdersList,
    required this.numberOfUsers,
    required this.salesAmount,
    required this.isLoading,
    required this.exception,
    required this.categories,
  });

  AdminPanelState.empty()
      : usersList = [],
        dishesList = [],
        ordersList = [],
        unReadyOrdersList = [],
        numberOfUsers = 0,
        salesAmount = 0,
        isLoading = true,
        exception = '',
        categories = [];

  AdminPanelState copyWith({
    List<UserModel>? usersList,
    List<DishModel>? dishesList,
    List<OrdersHistoryUserInfoModel>? ordersList,
    List<OrdersHistoryUserInfoModel>? unReadyOrdersList,
    int? numberOfUsers,
    int? salesAmount,
    bool? isLoading,
    String? exception,
    List<String>? categories,
  }) {
    return AdminPanelState(
      usersList: usersList ?? this.usersList,
      dishesList: dishesList ?? this.dishesList,
      ordersList: ordersList ?? this.ordersList,
      unReadyOrdersList: unReadyOrdersList ?? this.unReadyOrdersList,
      numberOfUsers: numberOfUsers ?? this.numberOfUsers,
      salesAmount: salesAmount ?? this.salesAmount,
      isLoading: isLoading ?? this.isLoading,
      exception: exception ?? this.exception,
      categories: categories ?? this.categories,
    );
  }
}