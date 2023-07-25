import '../entities/menu_item_entity.dart';

abstract class IMenuItemRepository {
  Future<List<MenuItemEntity>> getMenuList(int page);
}
