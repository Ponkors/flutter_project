import 'package:data/data.dart';

abstract class OrdersHistoryDataProvider {
  Future<void> addOrder(OrdersHistoryEntity ordersHistoryEntity);
  Future<List<OrdersHistoryEntity>> fetchOrders(String uid);
}