import 'package:data/models/header_menu_item_model.dart';
import 'package:domain/domain.dart';

class HeaderMenuItemMapper {
  static HeaderMenuItemModel toModel(HeaderMenuItemEntity entity) {
    return HeaderMenuItemModel(
        image: entity.image,
    );
  }

  static HeaderMenuItemEntity toEntity(HeaderMenuItemModel model) {
    return HeaderMenuItemEntity(
      image: model.image,
    );
  }
}