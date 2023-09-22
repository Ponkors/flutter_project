import 'package:domain/domain.dart';

class AddOrdersHistoryUseCase implements FutureUseCase<OrdersHistoryModel, void> {
  final OrdersHistoryRepository _ordersHistoryRepository;

  AddOrdersHistoryUseCase({
    required OrdersHistoryRepository ordersHistoryRepository,
  }) : _ordersHistoryRepository = ordersHistoryRepository;

  @override
  Future<void> execute(OrdersHistoryModel order) async {
    await _ordersHistoryRepository.addOrder(order);
  }
}