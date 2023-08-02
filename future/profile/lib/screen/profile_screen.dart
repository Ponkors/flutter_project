import 'package:core_ui/core_ui.dart';
import 'package:flutter/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppConstants.labelProfile,
        style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.black),
      ),
    );
  }
}
