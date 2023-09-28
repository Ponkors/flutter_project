import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:menu/ui/widget/dish_card_button.dart';
import 'package:orders/orders.dart';

class DishItem extends StatelessWidget {
  final DishModel dish;
  final VoidCallback onTap;

  const DishItem({
    required this.dish,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final CartBloc cartBloc = BlocProvider.of<CartBloc>(context);
    return InkWell(
      splashColor: AppColors.orange,
      borderRadius: const BorderRadius.all(
        Radius.circular(AppDimens.radius_16),
      ),
      onTap: onTap,
      child: Card(
        shadowColor: AppColors.lightGrey,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppDimens.radius_16),
          ),
        ),
        child: Container(
          child: Row(
            children: <Widget>[
              Hero(
                tag: dish.imageURL,
                child: CacheAppImage(
                  imageURL: dish.imageURL,
                  height: AppDimens.size_110,
                  fit: BoxFit.none,
                ),
              ),
              const SizedBox(height: AppDimens.size_10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    dish.title,
                    style: GoogleFonts.poppins(
                      textStyle: AppFonts.normal_18,
                    ),
                  ),
                  SizedBox(height: AppDimens.size_5),
                  Text(
                    '\$\$ ● ${dish.category}',
                    style: GoogleFonts.poppins(
                      textStyle: AppFonts.normal_14,
                    ),
                  ),
                  SizedBox(height: AppDimens.size_5),
                  Row(
                    children: <Widget>[
                      Text(
                        '${'selectDishScreen.cost'.tr()} \$${dish.cost}',
                        style: GoogleFonts.poppins(
                          textStyle: AppFonts.normal_18_bold,
                          color: themeData.primaryColor,
                        ),
                      ),
                      SizedBox(width: AppDimens.size_30),
                      DishCardButton(
                        label: '${'menuScreen.add'.tr()}',
                        onPressed: () {
                          cartBloc.add(
                            AddDishToCart(dish: dish),
                          );
                          final SnackBar snackBar = SnackBar(
                            content: Text(
                              'menuScreen.dishAddedToTheCart'.tr(),
                              style: GoogleFonts.poppins(
                                textStyle: AppFonts.normal_18,
                              ),
                            ),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: themeData.primaryColor,
                            duration: const Duration(seconds: 2),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

