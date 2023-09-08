import 'package:domain/usecases/usecases.dart';

import '../entities/horizontal_menu_item_entity.dart';
import '../repositories/horizontal_menu_item_repository.dart';

class GetHorizontalMenuListUseCase extends FutureUseCase<List<HorizontalMenuItemEntity>, int> {
  final IHorizontalMenuItemRepository horizontalMenuItemRepository;

  GetHorizontalMenuListUseCase(this.horizontalMenuItemRepository);

  @override
  Future<List<HorizontalMenuItemEntity>> execute(int input) async {
    return await horizontalMenuItemRepository.getHorizontalMenuList(input);
  }
}
