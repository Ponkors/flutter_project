import '../entities/horizontal_menu_item_entity.dart';

abstract class IHorizontalMenuItemRepository {
  Future<List<HorizontalMenuItemEntity>> getHorizontalMenuList(int page);
}