part of 'local_order_history_data_provider.dart';

class LocalOrdersHistoryDataProviderImpl implements LocalOrdersHistoryDataProvider {
  const LocalOrdersHistoryDataProviderImpl();

  @override
  Future<void> saveOrdersToCache(List<OrdersHistoryModel> orders) async {
    final Box<OrdersHistoryEntity> ordersBox = await Hive.openBox('orders');
    await ordersBox.clear();
    final List<OrdersHistoryEntity> ordersEntity = orders
        .map(
          (OrdersHistoryModel order) => OrdersHistoryMapper.toEntity(order),
    )
        .toList();
    await ordersBox.addAll(ordersEntity);
  }

  @override
  Future<void> addOrderToCache(OrdersHistoryModel order) async {
    final Box<OrdersHistoryEntity> ordersBox = await Hive.openBox('orders');
    await ordersBox.add(OrdersHistoryMapper.toEntity(order));
  }

  @override
  Future<List<OrdersHistoryEntity>> getCachedOrders() async {
    final Box<OrdersHistoryEntity> ordersBox = await Hive.openBox('orders');
    final List<OrdersHistoryEntity> ordersEntity = ordersBox.values.toList();
    return ordersEntity;
  }
}