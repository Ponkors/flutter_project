import 'package:authentication/bloc/submit_status.dart';
import 'package:authentication/ui/app_text_field.dart';
import 'package:authentication/ui/submit_button.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import 'package:authentication/authentication.dart';

class AuthenticationSingInForm extends StatefulWidget {
  const AuthenticationSingInForm({super.key});

  @override
  State<AuthenticationSingInForm> createState() => _AuthenticationSingInFormState();
}

class _AuthenticationSingInFormState extends State<AuthenticationSingInForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final AuthenticationBloc bloc = BlocProvider.of(context);
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.padding_20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AppTextField(
                hintText: 'Email',
                icon: const Icon(
                  Icons.email
                ),
                obscureText: false,
                validator: (value) {
                  if (value!.isEmpty){
                    return 'authenticationScreen.emailRequired'.tr();
                  } else if (!value.contains('@')) {
                    return 'authenticationScreen.emailFormatWrong'.tr();
                  }
                  return null;
                },
                textEditingController: emailController,
              ),
              SizedBox(height: AppDimens.size_10),
              AppTextField(
                hintText: 'Password',
                icon: Icon(
                  Icons.password,
                ),
                obscureText: true,
                validator: (value) {
                  return value!.length < 8
                    ? 'authenticationScreen.invalidPassword'.tr()
                    : null;
                },
                textEditingController: passwordController,
              ),
              SizedBox(height: AppDimens.size_10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      //context.pushRoute(
                        //ResetPasswordRoute(),
                      //);
                    },
                    child: Text(
                      'Forgot Password',
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppDimens.size_10),
              BlocListener<AuthenticationBloc, AuthenticationState>(
                listener: (BuildContext context, AuthenticationState state) {
                  final SubmitStatusForm formStatus = bloc.state.statusForm;
                  if (formStatus is SubmissionFailed) {
                    _showSnackBar(
                      context,
                      formStatus.exception.toString(),
                    );
                  }
                  if (formStatus is SubmissionSuccess) {
                    bloc.add(
                      NavigateToMenuPage(),
                    );
                  }
                },
                listenWhen: (AuthenticationState previous,
                    AuthenticationState current) {
                  return previous.statusForm != current.statusForm;
                },
                child: SubmitButton(
                  label: 'Sign In',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      bloc.add(
                        SignInSubmitted(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        ),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(height: AppDimens.size_20),
            ],
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _showSnackBar(BuildContext context, String message) {
    final SnackBar snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
