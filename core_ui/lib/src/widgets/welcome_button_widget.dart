import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const WelcomeButtonWidget(this.onPressed);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: AppColors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.size_10),
        ),
        minimumSize: Size(
            AppDimens.size_335,
            AppDimens.size_48,
        ),
      ),
      child: Text(
        AppConstants.getStarted,
        style: GoogleFonts.gothicA1(
          color: AppColors.white,
          fontSize: 14,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.1,
        ),
      ),
    );
  }
}
