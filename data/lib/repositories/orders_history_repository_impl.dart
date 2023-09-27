import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';

class OrdersHistoryRepositoryImpl implements OrdersHistoryRepository {
  final FirebaseFirestoreDataProvider _firebaseFirestoreDataProvider;
  final HiveProvider _hiveProvider;

  const OrdersHistoryRepositoryImpl({
    required FirebaseFirestoreDataProvider firebaseFirestoreDataProvider,
    required HiveProvider hiveProvider,
  })  : _firebaseFirestoreDataProvider = firebaseFirestoreDataProvider,
        _hiveProvider = hiveProvider;

  @override
  Future<void> addOrder(OrdersHistoryModel orderModel) async {
    final OrdersHistoryEntity orderEntity = OrdersHistoryMapper.toEntity(orderModel);
    await _firebaseFirestoreDataProvider.addOrder(orderEntity);
    await _hiveProvider.addOrderToCache(orderModel);
  }

  @override
  Future<List<OrdersHistoryModel>> fetchOrders(String uid) async {
    final List<OrdersHistoryModel> orders;
    final bool hasInternetConnection =
    await InternetConnectionInfo.checkInternetConnection();

    if (hasInternetConnection) {
      final List<OrdersHistoryEntity> result =
      await _firebaseFirestoreDataProvider.fetchOrders(uid);
      orders = result
          .map((OrdersHistoryEntity order) => OrdersHistoryMapper.toModel(order))
          .toList();
      await _hiveProvider.saveOrdersToCache(orders);
    } else {
      final List<OrdersHistoryEntity> result =
      await _hiveProvider.getCachedOrders();
      orders = result
          .map((OrdersHistoryEntity order) => OrdersHistoryMapper.toModel(order))
          .toList();
    }
    return orders;
  }
}