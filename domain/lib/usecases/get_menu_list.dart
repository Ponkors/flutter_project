import 'package:domain/usecases/usecases.dart';

import '../entities/menu_item_entity.dart';
import '../repositories/menu_item_repository.dart';

class GetMenuListUseCase extends FutureUseCase<List<MenuItemEntity>, int> {
  final IMenuItemRepository menuItemRepository;

  GetMenuListUseCase(this.menuItemRepository);

  @override
  Future<List<MenuItemEntity>> execute(int input) async {
    return await menuItemRepository.getMenuList(input);
  }
}
