import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:orders/orders.dart';
import 'package:orders/ui/widgets/make_order_button.dart';

class TotalPrice extends StatelessWidget {
  final int totalPrice;
  final int itemCount;
  final VoidCallback onPressed;

  const TotalPrice({
    required this.totalPrice,
    required this.itemCount,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Column(
      children: <Widget>[
        Center(
          child: Text(
            '${'cartScreen.check'.tr()}',
            style: GoogleFonts.poppins(
              textStyle: AppFonts.normal_16,
            ),
          ),
        ),
        TornCheckDivider(),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppDimens.padding_10,
            horizontal: AppDimens.padding_20,
          ),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Icon(
                    Icons.attach_money_outlined,
                    size: AppDimens.size_20,
                  ),
                  Text(
                    '${'cartScreen.totalPrice'.tr()}:',
                    style: themeData.textTheme.titleMedium,
                  ),
                  Text(
                    '\$$totalPrice',
                    style: themeData.textTheme.titleMedium,
                  ),
                  const Icon(
                    Icons.shopping_cart_checkout_outlined,
                    size: AppDimens.size_20,
                  ),
                  Text(
                    '${'cartScreen.dishPositionCount'.tr()}:',
                    style: themeData.textTheme.titleMedium,
                  ),
                  Text(
                    itemCount.toString(),
                    style: themeData.textTheme.titleMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
        MakeAnOrderButton(onPressed: onPressed),
      ],
    );
  }
}