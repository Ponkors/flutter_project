import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:history/history.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import 'package:orders/orders.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CartBloc cartBloc = BlocProvider.of(context);
    final OrdersHistoryBloc ordersHistoryBloc = BlocProvider.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'menuPage.cart'.tr(),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (_, CartState state) {
          if (state.cart.dishes.isNotEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(AppDimens.padding_10),
                    itemCount: state.cart.dishes.length,
                    itemBuilder: (_, int index) {
                      return CartItem(
                        cartItem: state.cart.dishes.elementAt(index),
                      );
                    },
                  ),
                ),
                TotalPrice(
                  totalPrice: state.cart.totalPrice,
                  onPressed: () {
                    ordersHistoryBloc.add(
                      AddOrder(
                        order: OrdersHistoryModel(
                          id: state.userUid,
                          cart: state.cart,
                          dateTime: DateTime.now(),
                        ),
                      ),
                    );
                    _showSnackBar(
                        context,
                        'cartScreen.acceptedOrder'.tr(),
                    );
                    cartBloc.add(ClearCart());
                  },
                  itemCount: state.cart.dishes.length,
                ),
              ],
            );
          } else {
            return CartEmpty(
              onPressed: () {
                context.navigateTo(const MenuRoute());
              },
            );
          }
        },
      ),
    );
  }
  void _showSnackBar(BuildContext context, String message) {
    final ThemeData themeData = Theme.of(context);
    final SnackBar snackBar = SnackBar(
      content: Text(
        message,
        style: themeData.textTheme.titleMedium!.copyWith(
          color: AppColors.white,
        ),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: themeData.primaryColor,
      duration: const Duration(milliseconds: 1500),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
