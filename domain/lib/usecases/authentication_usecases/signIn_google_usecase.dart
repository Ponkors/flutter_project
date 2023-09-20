import 'package:domain/domain.dart';

class SignInWithGoogleUseCase implements FutureUseCase<NoParams, UserModel> {
  final AuthenticationRepository _authenticationRepository;

  SignInWithGoogleUseCase({
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  @override
  Future<UserModel> execute(NoParams input) async {
    return _authenticationRepository.signInWithGoogle();
  }
}