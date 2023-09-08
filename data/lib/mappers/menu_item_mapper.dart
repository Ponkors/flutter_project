import 'package:data/models/menu_item_model.dart';
import 'package:domain/domain.dart';

class MenuItemMapper {
  static MenuItemModel toModel(MenuItemEntity entity) {
    return MenuItemModel(
      image: entity.image,
      name: entity.name,
      type: entity.type,
      ingredients: entity.ingredients,
      details: entity.details,
      cost: entity.cost,
    );
  }

  static MenuItemEntity toEntity(MenuItemModel model) {
    return MenuItemEntity(
      image: model.image,
      name: model.name,
      type: model.type,
      ingredients: model.ingredients,
      details: model.details,
      cost: model.cost,
    );
  }
}
