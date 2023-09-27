import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';

class AddButton extends StatelessWidget {
  final VoidCallback onPressed;
  const AddButton({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimens.size_335,
      height: AppDimens.size_50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          onPrimary: AppColors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.radius_10),
          ),
          textStyle: GoogleFonts.poppins(
            textStyle: AppFonts.normal_16.copyWith(
                color: AppColors.white,
            ),
          ),
        ),
        child: Text(
          '${'selectDishScreen.add'.tr()}',
        ),
      ),
    );
  }
}
