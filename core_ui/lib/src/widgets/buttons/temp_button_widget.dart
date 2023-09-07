import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class TempButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;

  const TempButtonWidget(this.onPressed, this.title);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: AppColors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.radius_10),
        ),
        minimumSize: Size(AppDimens.size_115, AppDimens.size_40),
      ),
      child: Text(
        title,
          style: GoogleFonts.poppins(textStyle: AppFonts.s14_w600),
      ),
    );
  }
}
