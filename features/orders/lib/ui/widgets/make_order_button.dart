import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core/core.dart';

class MakeAnOrderButton extends StatelessWidget {
  final VoidCallback onPressed;

  MakeAnOrderButton({
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final ThemeData themeData = Theme.of(context);
    return SizedBox(
      width: mediaQueryData.size.width * 0.9,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppDimens.radius_16,
            )
          ),
          textStyle: GoogleFonts.poppins(
            textStyle: AppFonts.normal_16,
            color: themeData.primaryColor,
          ),
        ),
        child: Text('cartScreen.makeAnOrder'.tr()),
      ),
    );
  }
}
