part of 'history_bloc.dart';

abstract class OrdersHistoryEvent {
  const OrdersHistoryEvent();
}

class InitializeListOfOrdersHistory extends OrdersHistoryEvent{
  InitializeListOfOrdersHistory();
}

class LoadOrdersHistory extends OrdersHistoryEvent {
  LoadOrdersHistory();
}

class AddOrder extends OrdersHistoryEvent {
  final OrdersHistoryModel order;

  AddOrder({
    required this.order,
  });
}