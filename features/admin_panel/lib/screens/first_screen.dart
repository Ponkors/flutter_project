import 'package:admin_panel/admin_panel.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:authentication/authentication.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc authenticationBloc =
      BlocProvider.of<AuthenticationBloc>(context);
    final AdminPanelBloc adminPanelBloc =
      BlocProvider.of<AdminPanelBloc>(context);
    adminPanelBloc.add(const InitOrders());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'menuPage.adminPanel'.tr(),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              authenticationBloc.add(SignOutSubmitted());
              authenticationBloc.add(NavigateToSignInScreen());
            },
            icon: const Icon(
              Icons.logout,
              color: AppColors.grey,
            ),
          )
        ],
      ),
    );
  }
}
