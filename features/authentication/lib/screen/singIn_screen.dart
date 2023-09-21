import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            WelcomeCardWidget(),
            Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: AppDimens.size_40),
                  // AuthenticationSingInForm(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
