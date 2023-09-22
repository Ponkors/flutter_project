import 'package:data/data.dart';
import 'package:domain/domain.dart';

abstract class OrdersHistoryMapper {
  static OrdersHistoryEntity toEntity(OrdersHistoryModel model) {
    return OrdersHistoryEntity(
      id: model.id,
      cart: CartMapper.toEntity(model.cart),
      dateTime: model.dateTime,
    );
  }

  static OrdersHistoryModel toModel(OrdersHistoryEntity entity) {
    return OrdersHistoryModel(
      id: entity.id,
      cart: CartMapper.toModel(entity.cart),
      dateTime: entity.dateTime,
    );
  }
}