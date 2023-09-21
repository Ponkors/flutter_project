import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final bool obscureText;
  final Icon icon;
  final String? Function(String?)? validator;

  const AppTextField({
    required this.textEditingController,
    required this.hintText,
    required this.obscureText,
    required this.icon,
    required this.validator,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        icon: icon,
        iconColor: themeData.primaryColor,
        hintText: hintText,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: themeData.primaryColor,
          ),
        ),
      ),
      controller: textEditingController,
      validator: validator,
    );
  }
}
