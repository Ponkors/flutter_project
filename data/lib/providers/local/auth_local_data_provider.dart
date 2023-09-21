import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:data/data.dart';

part 'auth_local_data_provider_impl.dart';

abstract class AuthenticationLocalDataProvider {
  Future<UserEntity> getUserFromLocal();
  Future<void> saveUserToLocal(UserModel userModel);
  Future<void> deleteUserFromLocal();
}