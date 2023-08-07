import 'package:data/models/menu_item_model.dart';
import 'package:domain/domain.dart';

class MenuItemMapper {
  static MenuItemModel toModel(MenuItemEntity entity) {
    return MenuItemModel(
      image: entity.image,
      name: entity.name,
    );
  }

  static MenuItemEntity toEntity(MenuItemModel model) {
    return MenuItemEntity(
      image: model.image,
      name: model.name,
    );
  }
}
