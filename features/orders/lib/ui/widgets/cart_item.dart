import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:orders/orders.dart';

class CartItem extends StatelessWidget {
  final CartDish cartItem;

  const CartItem({
    required this.cartItem,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final CartBloc cartBloc = BlocProvider.of<CartBloc>(context);
    final ThemeData themeData = Theme.of(context);
    return Card(
      shadowColor: AppColors.lightGrey,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(AppDimens.padding_16),
        ),
      ),
      child: Container(
        child: Row(
          children: <Widget>[
            Hero(
              tag: cartItem.dish.imageURL,
              child: CacheAppImage(
                imageURL: cartItem.dish.imageURL,
                height: AppDimens.size_110,
                fit: BoxFit.none,
              ),
            ),
            const SizedBox(width: AppDimens.size_5),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  cartItem.dish.title,
                  style: GoogleFonts.poppins(
                    textStyle: AppFonts.normal_18,
                  ),
                ),
                const SizedBox(width: AppDimens.size_5),
                Text(
                  '\$\$ ● ${cartItem.dish.category}',
                  style: GoogleFonts.poppins(
                    textStyle: AppFonts.normal_14,
                  ),
                ),
                Row(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        cartBloc.add(
                          RemoveDishFromCart(cartDish: cartItem),
                        );
                      },
                      icon: Icon(
                        Icons.remove_circle_outline,
                        color: themeData.primaryColor,
                      ),
                    ),
                    Text(
                      '${cartItem.quantity}',
                      style: GoogleFonts.poppins(
                        textStyle: AppFonts.normal_14,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        cartBloc.add(
                          AddDishToCart(dish: cartItem.dish),
                        );
                      },
                      icon: Icon(
                        Icons.add_circle_outline,
                        color: themeData.primaryColor,
                      ),
                    ),
                    Text(
                      '${'selectDishScreen.cost'.tr()} \$${cartItem.dish.cost}',
                      style: GoogleFonts.poppins(
                        textStyle: AppFonts.normal_18,
                        color: themeData.primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
