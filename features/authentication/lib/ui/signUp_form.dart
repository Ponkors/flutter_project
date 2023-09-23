import 'package:authentication/ui/app_text_field.dart';
import 'package:authentication/ui/logIn_switch.dart';
import 'package:authentication/ui/submit_button.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:authentication/authentication.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc bloc = BlocProvider.of(context);
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.padding_20,
          ),
          child: Column(
            children: <Widget>[
              AppTextField(
                hintText: 'authenticationScreen.userName'.tr(),
                icon: const Icon(
                  Icons.person,
                ),
                obscureText: false,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'authenticationScreen.userNameIsRequired'.tr();
                  } else if (value.length < 5) {
                    return 'authenticationScreen.invalidUserName'.tr();
                  }
                  return null;
                },
                textEditingController: userNameController,
              ),
              const SizedBox(height: AppDimens.size_20),
              AppTextField(
                hintText: 'authenticationScreen.email'.tr(),
                icon: const Icon(
                  Icons.email,
                ),
                obscureText: false,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'authenticationScreen.emailRequired'.tr();
                  } else if (!value.contains('@')) {
                    return 'authenticationScreen.emailFormatWrong'.tr();
                  }
                  return null;
                },
                textEditingController: emailController,
              ),
              const SizedBox(height: AppDimens.size_20),
              AppTextField(
                hintText: 'authenticationScreen.password'.tr(),
                icon: const Icon(
                  Icons.password,
                ),
                obscureText: false,
                validator: (value) {
                  return value!.length < 6
                      ? 'authenticationScreen.invalidPassword'.tr()
                      : null;
                },
                textEditingController: passwordController,
              ),
              const SizedBox(height: AppDimens.size_20),
              BlocListener<AuthenticationBloc, AuthenticationState>(
                listener: (BuildContext context, AuthenticationState state) {
                  final SubmissionStatusForm statusForm = bloc.state.statusForm;
                  if (statusForm is SubmissionFormFailed) {
                    _showSnackBar(
                      context,
                      statusForm.exception.toString(),
                    );
                  }
                  if (statusForm is SubmissionFormSuccess) {
                    bloc.add(NavigateToMenuPage());
                  }
                },
                listenWhen: (AuthenticationState previous, AuthenticationState current) {
                  return previous.statusForm != current.statusForm;
                },
                child: SubmitButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      bloc.add(
                        SignUpSubmitted(
                          userName: userNameController.text.trim(),
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        ),
                      );
                    }
                  },
                  label: 'authenticationScreen.signUp'.tr(),
                ),
              ),
              const SizedBox(height: AppDimens.size_20),
              LogInSwitch(
                title: 'authenticationScreen.haveAccount'.tr(),
                label: 'authenticationScreen.signIn'.tr(),
                onPressed: () {
                  bloc.add(ChangeSignInPage());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _showSnackBar(BuildContext context, String message) {
    final SnackBar snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}