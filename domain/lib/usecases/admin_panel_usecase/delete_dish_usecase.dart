import 'package:domain/domain.dart';

class DeleteDishUseCase implements FutureUseCase<String, void> {
  final AdminPanelRepository _adminPanelRepository;

  const DeleteDishUseCase({
    required AdminPanelRepository adminPanelRepository
  }) : _adminPanelRepository = adminPanelRepository;

  @override
  Future<void> execute(String id) async {
    await _adminPanelRepository.deleteProduct(id: id);
  }
}