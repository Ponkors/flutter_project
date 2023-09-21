import 'package:data/data.dart';
import 'package:domain/domain.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationDataProvider _authenticationDataProvider;
  final AuthenticationLocalDataProvider _authenticationLocalDataProvider;

  const AuthenticationRepositoryImpl({
    required AuthenticationDataProvider authenticationDataProvider,
    required AuthenticationLocalDataProvider authenticationLocalDataProvider,
  })  : _authenticationLocalDataProvider = authenticationLocalDataProvider,
        _authenticationDataProvider = authenticationDataProvider;

  @override
  Future<UserModel> signUp({
    required String userName,
    required String email,
    required String password,
  }) async {
    final UserEntity userEntity =
    await _authenticationDataProvider.signUpWithEmailAndPassword(
      userName: userName,
      email: email,
      password: password,
    );
    final UserModel userModel = UserMapper.toModel(userEntity);
    await _authenticationLocalDataProvider.saveUserToLocal(userModel);
    return userModel;
  }

  @override
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    final UserEntity userEntity =
    await _authenticationDataProvider.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final UserModel userModel = UserMapper.toModel(userEntity);
    await _authenticationLocalDataProvider.saveUserToLocal(userModel);
    return userModel;
  }

  @override
  Future<UserModel> signInWithGoogle() async {
    final UserEntity userEntity = await _authenticationDataProvider
        .signInWithGoogle();
    final UserModel userModel = UserMapper.toModel(userEntity);
    await _authenticationLocalDataProvider.saveUserToLocal(userModel);
    return userModel;
  }

  @override
  Future<void> signOut() async {
    await _authenticationDataProvider.signOut();
    await _authenticationLocalDataProvider.deleteUserFromLocal();
  }

  @override
  Future<void> resetPassword({
    required String email,
  }) async {
    await _authenticationDataProvider.resetPassword(email: email);
  }

  @override
  Future<UserModel> getUserFromStorage() async {
    final UserEntity userEntity =
    await _authenticationLocalDataProvider.getUserFromLocal();
    return UserMapper.toModel(userEntity);
  }
}