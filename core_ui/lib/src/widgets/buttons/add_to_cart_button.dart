import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimens.size_335,
      height: AppDimens.size_50,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.orange,
          onPrimary: AppColors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.radius_10),
          ),
          textStyle: GoogleFonts.poppins(
            textStyle: AppFonts.buttons_14.copyWith(
                color: AppColors.white,
            ),
          ),
        ),
        child: Text(
          AppConstants.addToCart.toUpperCase(),
        ),
      ),
    );
  }
}
