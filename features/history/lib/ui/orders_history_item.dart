import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class OrdersHistoryItem extends StatelessWidget {
  final OrdersHistoryModel ordersHistoryItem;

  const OrdersHistoryItem({
    required this.ordersHistoryItem,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: AppDimens.size_5,
        horizontal: AppDimens.size_20,
      ),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.radius_16),
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.all(AppDimens.padding_10),
        leading: Icon(Icons.receipt),
        title: Text(
          '${'orderHistoryScreen.price'.tr()} \$${ordersHistoryItem.cart.totalPrice}',
          style: GoogleFonts.poppins(
            textStyle: AppFonts.normal_18,
          ),
        ),
        subtitle: Text(
          DateFormat('dd/MM/yyyy hh:mm').format(ordersHistoryItem.dateTime),
          style: GoogleFonts.poppins(
            textStyle: AppFonts.normal_14,
          ),
        ),
        children: <Widget>[
          ...List.generate(
            ordersHistoryItem.cart.dishes.length,
            ((int index) {
              final CartDish cartDish = ordersHistoryItem.cart.dishes[index];
              final subtotal = cartDish.dish.cost * cartDish.quantity;
              return ListTile(
                title: Text(
                  '  ●  ' + cartDish.dish.title,
                  style: GoogleFonts.poppins(
                    textStyle: AppFonts.normal_16,
                  ),
                ),
                subtitle: Text(
                  '\$${cartDish.dish.cost} x ${cartDish.quantity}',
                  style: GoogleFonts.poppins(
                    textStyle: AppFonts.normal_16,
                  ),
                ),
                trailing: Text(
                  '\$${subtotal.toStringAsFixed(0)}',
                  style: GoogleFonts.poppins(
                    textStyle: AppFonts.s16_w400,
                  ),
                ),
              );
            }),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppDimens.padding_10,
              horizontal: AppDimens.padding_10,
            ),
            child: Text(
              '${'orderHistoryScreen.id'.tr()} ${ordersHistoryItem.id}',
              style: GoogleFonts.poppins(
                textStyle: AppFonts.s16_w400,
                color: AppColors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


/*
This comment for future update. Sensei, please don't comment it in code review :)
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class OrdersHistoryItem extends StatelessWidget {
  final OrdersHistoryModel ordersHistoryItem;

  const OrdersHistoryItem({
    required this.ordersHistoryItem,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: AppDimens.size_5,
        horizontal: AppDimens.size_10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ExpansionTile(
            tilePadding: const EdgeInsets.all(AppDimens.padding_10),
            title: Text(
              'Check amount: \$${ordersHistoryItem.cart.totalPrice}',
              style: GoogleFonts.poppins(
                textStyle: AppFonts.normal_18,
              ),
            ),
            subtitle: Text(
              DateFormat('dd/MM/yyyy hh:mm').format(ordersHistoryItem.dateTime),
              style: GoogleFonts.poppins(
                textStyle: AppFonts.normal_14,
              ),
            ),
            children: <Widget>[
              ...List.generate(
                ordersHistoryItem.cart.dishes.length,
                ((int index) {
                  final CartDish cartDish = ordersHistoryItem.cart.dishes[index];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '  ●  ' + cartDish.dish.title,
                        style: GoogleFonts.poppins(
                          textStyle: AppFonts.normal_16,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            '\$${cartDish.dish.cost} x ${cartDish.quantity}',
                            style: GoogleFonts.poppins(
                              textStyle: AppFonts.normal_16,
                            ),
                          ),
                          SizedBox(width: AppDimens.size_20),
                          Text(
                            '\$${cartDish.quantity * cartDish.dish.cost}',
                            style: GoogleFonts.poppins(
                              textStyle: AppFonts.s16_w400,
                            ),
                          ),
                          const SizedBox(height: AppDimens.size_10),
                        ],
                      ),
                    ],
                  );
                }),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppDimens.padding_10,
              horizontal: AppDimens.padding_10,
            ),
            child: Text(
              'Order iD: \$${ordersHistoryItem.id}',
              style: GoogleFonts.poppins(
                textStyle: AppFonts.s16_w400,
                color: AppColors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
 */

