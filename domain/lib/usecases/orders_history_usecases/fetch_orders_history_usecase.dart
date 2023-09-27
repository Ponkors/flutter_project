import 'package:domain/domain.dart';

class FetchOrdersHistoryUseCase implements FutureUseCase<String,
    List<OrdersHistoryModel>> {
  final OrdersHistoryRepository _ordersHistoryRepository;

  FetchOrdersHistoryUseCase({
    required OrdersHistoryRepository ordersHistoryRepository,
  }) : _ordersHistoryRepository = ordersHistoryRepository;

  @override
  Future<List<OrdersHistoryModel>> execute(String uid) async {
    return _ordersHistoryRepository.fetchOrders(uid);
  }
}