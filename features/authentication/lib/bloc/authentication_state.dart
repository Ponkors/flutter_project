part of 'authentication_bloc.dart';

class AuthenticationState {
  final UserModel userModel;
  final bool isLogged;
  final SubmitStatusForm statusForm;

  AuthenticationState({
    required this.userModel,
    required this.isLogged,
    required this.statusForm,
  });

  AuthenticationState.empty() :
    userModel = const UserModel.empty(),
    isLogged = false,
    statusForm = const InitSubmitStatus();

  AuthenticationState copyWith({
    UserModel? userModel,
    bool? isLogged,
    SubmitStatusForm? submitStatus,
  }) {
    return AuthenticationState(
      userModel: userModel ?? this.userModel,
      isLogged: isLogged ?? this.isLogged,
      statusForm: statusForm ?? this.statusForm,
    );
  }
}