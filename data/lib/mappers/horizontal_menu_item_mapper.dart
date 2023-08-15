import 'package:data/models/horizontal_menu_item_model.dart';
import 'package:domain/domain.dart';

class HorizontalMenuItemMapper {
  static HorizontalMenuItemModel toModel(HorizontalMenuItemEntity entity) {
    return HorizontalMenuItemModel(
      image: entity.image,
      name: entity.name,
      type: entity.type,
      ingredients: entity.ingredients,
      details: entity.details,
      cost: entity.cost
    );
  }

  static HorizontalMenuItemEntity toEntity(HorizontalMenuItemModel model) {
    return HorizontalMenuItemEntity(
      image: model.image,
      name: model.name,
      type: model.type,
      ingredients: model.ingredients,
      details: model.details,
      cost: model.cost,
    );
  }
}