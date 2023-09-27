import 'package:data/data.dart';
import 'package:domain/domain.dart';

abstract class OrdersHistoryUserInfoMapper {
  static OrdersHistoryUserInfoEntity toEntity(OrdersHistoryUserInfoModel model) {
    return OrdersHistoryUserInfoEntity(
      userEntity: UserMapper.toEntity(model.userModel),
      ordersHistoryEntity: OrdersHistoryMapper.toEntity(model.ordersHistoryModel),
    );
  }

  static OrdersHistoryUserInfoModel toModel(OrdersHistoryUserInfoEntity entity) {
    return OrdersHistoryUserInfoModel(
      userModel: UserMapper.toModel(entity.userEntity),
      ordersHistoryModel: OrdersHistoryMapper.toModel(entity.ordersHistoryEntity),
    );
  }
}