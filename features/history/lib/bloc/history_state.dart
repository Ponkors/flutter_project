part of 'history_bloc.dart';

class OrdersHistoryState {
  final bool isLoading;
  final Object exception;
  final List<OrdersHistoryModel> orderItems;

  OrdersHistoryState({
    required this.isLoading,
    required this.exception,
    required this.orderItems,
  });

  OrdersHistoryState.empty() :
      isLoading = true,
      exception = '',
      orderItems = [];

  OrdersHistoryState copyWith({
    bool? isLoading,
    Object? exception,
    List<OrdersHistoryModel>? orderItems,
  }) {
    return OrdersHistoryState(
      isLoading: isLoading ?? this.isLoading,
      exception: exception ?? this.exception,
      orderItems: orderItems ?? this.orderItems,
    );
  }
}