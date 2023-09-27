import 'package:domain/domain.dart';

class FetchAllOrdersUseCase
    implements FutureUseCase<NoParams, List<OrdersHistoryUserInfoModel>> {
  final AdminPanelRepository _adminPanelRepository;

  const FetchAllOrdersUseCase({
    required AdminPanelRepository adminPanelRepository,
  }) : _adminPanelRepository = adminPanelRepository;

  @override
  Future<List<OrdersHistoryUserInfoModel>> execute(NoParams noParams) async {
    return _adminPanelRepository.fetchAllOrders();
  }
}