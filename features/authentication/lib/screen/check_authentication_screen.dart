import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:authentication/authentication.dart';

class CheckAuthenticationScreen extends StatelessWidget {
  const CheckAuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc bloc = BlocProvider.of<AuthenticationBloc>(context);
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (BuildContext context, AuthenticationState state){
        if (state.isLogged) {
          bloc.add(
            NavigateToMenuPage(),
          );
        } else {
          bloc.add(
            NavigateToLoginScreen(),
          );
        }
      },
      child: const Center(
        child: LoadingIndicator(),
      ),
    );
  }
}
