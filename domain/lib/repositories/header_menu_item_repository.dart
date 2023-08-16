import '../entities/header_menu_item_entity.dart';

abstract class IHeaderMenuItemRepository {
  Future<List<HeaderMenuItemEntity>> getHeaderMenuList(int page);
}