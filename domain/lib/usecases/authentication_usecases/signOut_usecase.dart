import 'package:domain/domain.dart';

class SignOutUseCase implements FutureUseCase<NoParams, void> {
  final AuthenticationRepository _authenticationRepository;

  SignOutUseCase({
    required AuthenticationRepository authentication,
  }) : _authenticationRepository = authentication;

  @override
  Future<void> execute(NoParams input) async {
    return _authenticationRepository.signOut();
  }
}