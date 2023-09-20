import 'package:domain/domain.dart';
import 'package:domain/repositories/authentication_repository.dart';

class ResetPasswordUseCase implements FutureUseCase<String, void> {
  final AuthenticationRepository _authenticationRepository;

  ResetPasswordUseCase({
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  @override
  Future<void> execute(String email) async {
    return _authenticationRepository.resetPassword(email: email);
  }
}