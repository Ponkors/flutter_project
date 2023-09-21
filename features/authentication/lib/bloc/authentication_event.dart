part of 'authentication_bloc.dart';

abstract class AuthenticationEvent {
  const AuthenticationEvent();
}

class InitAuthentication extends AuthenticationEvent {
  InitAuthentication();
}

class SignInSubmitted extends AuthenticationEvent {
  final String email;
  final String password;

  SignInSubmitted({
    required this.email,
    required this.password,
  });
}

class SignInWithGoogleSubmitted extends AuthenticationEvent {
  SignInWithGoogleSubmitted();
}

class SignUpSubmitted extends AuthenticationEvent {
  final String userName;
  final String email;
  final String password;

  SignUpSubmitted({
    required this.userName,
    required this.email,
    required this.password,
  });
}

class SignOutSubmitted extends AuthenticationEvent {
  SignOutSubmitted();
}

class ResetPasswordSubmitted extends AuthenticationEvent {
  final String email;

  ResetPasswordSubmitted({
    required this.email,
  });
}

class NavigateToMenuPage extends AuthenticationEvent {
  NavigateToMenuPage();
}

class NavigateToLoginScreen extends AuthenticationEvent {
  NavigateToLoginScreen();
}


