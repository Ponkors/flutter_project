import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';

class OrdersHistoryRepositoryImpl implements OrdersHistoryRepository {
  final OrdersHistoryDataProvider _ordersHistoryDataProvider;
  final LocalOrdersHistoryDataProvider _localOrdersHistoryDataProvider;

  const OrdersHistoryRepositoryImpl({
    required OrdersHistoryDataProvider ordersHistoryDataProvider,
    required LocalOrdersHistoryDataProvider localOrdersHistoryDataProvider,
  })  : _ordersHistoryDataProvider = ordersHistoryDataProvider,
        _localOrdersHistoryDataProvider = localOrdersHistoryDataProvider;

  @override
  Future<void> addOrder(OrdersHistoryModel orderModel) async {
    final OrdersHistoryEntity orderEntity = OrdersHistoryMapper.toEntity(orderModel);
    await _ordersHistoryDataProvider.addOrder(orderEntity);
    await _localOrdersHistoryDataProvider.addOrderToCache(orderModel);
  }

  @override
  Future<List<OrdersHistoryModel>> fetchOrders(String uid) async {
    final List<OrdersHistoryModel> orders;
    final bool hasInternetConnection =
    await InternetConnectionInfo.checkInternetConnection();

    if (hasInternetConnection) {
      final List<OrdersHistoryEntity> result =
      await _ordersHistoryDataProvider.fetchOrders(uid);
      orders = result
          .map((OrdersHistoryEntity order) => OrdersHistoryMapper.toModel(order))
          .toList();
      await _localOrdersHistoryDataProvider.saveOrdersToCache(orders);
    } else {
      final List<OrdersHistoryEntity> result =
      await _localOrdersHistoryDataProvider.getCachedOrders();
      orders = result
          .map((OrdersHistoryEntity order) => OrdersHistoryMapper.toModel(order))
          .toList();
    }
    return orders;
  }
}