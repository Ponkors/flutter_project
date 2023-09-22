import 'package:domain/domain.dart';

abstract class OrdersHistoryRepository {
  Future<void> addOrder(OrdersHistoryModel order);
  Future<List<OrdersHistoryModel>> fetchOrders(String uid);
}