import 'package:data/data.dart';
import 'package:domain/domain.dart';

abstract class UserMapper {
  static UserEntity toEntity(UserModel model) {
    return UserEntity(
      identifierId: model.identifierId,
      userName: model.userName,
      email: model.email,
    );
  }

  static UserModel toModel(UserEntity entity) {
    return UserModel(
      identifierId: entity.identifierId,
      userName: entity.userName,
      email: entity.email,
    );
  }
}