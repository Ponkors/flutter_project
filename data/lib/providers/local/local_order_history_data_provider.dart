import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';

part 'local_order_history_data_provider_impl.dart';

abstract class LocalOrdersHistoryDataProvider {
  Future<List<OrdersHistoryEntity>> getCachedOrders();
  Future<void> saveOrdersToCache(List<OrdersHistoryModel> orders);
  Future<void> addOrderToCache(OrdersHistoryModel order);
}