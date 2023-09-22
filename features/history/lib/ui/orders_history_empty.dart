import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class OrdersHistoryEmpty extends StatelessWidget {
  final VoidCallback onPressed;

  const OrdersHistoryEmpty({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.history_outlined,
            size: AppDimens.size_110,
          ),
          Text(
            'Orders History is Empty'.tr(),
            style: GoogleFonts.poppins(
              textStyle: AppFonts.normal_20,
            ),
          ),
          Text(
            'cartScreen.additionTitle'.tr(),
            style: GoogleFonts.poppins(
              textStyle: AppFonts.normal_20,
            ),
          ),
          const SizedBox(height: AppDimens.size_30),
          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  AppDimens.size_10,
                ),
              ),
              minimumSize: Size(
                AppDimens.size_335,
                AppDimens.size_48,
              ),
              textStyle: GoogleFonts.poppins(
                textStyle: AppFonts.normal_20,
              ),
            ),
            child: Text(
              'cartScreen.chooseDishes'.tr(),
            ),
          ),
        ],
      ),
    );
  }
}
