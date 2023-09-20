import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import 'package:orders/orders.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CartBloc, CartState> (
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
                  onPressed: () {},
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
}

