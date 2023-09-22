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
        horizontal: AppDimens.size_2,
        vertical: AppDimens.size_5,
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.all(AppDimens.padding_10),
        title: Text('totalPrice'),
        subtitle: Text(
          DateFormat('dd/MM/YYYY hh:mm').format(ordersHistoryItem.dateTime),
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
                      cartDish.dish.title,
                    ),
                    Text(
                      '${cartDish.quantity}x \$${cartDish.dish.cost}',
                    ),
                  ],
                );
              }
            ),
          )
        ],
      ),
    );
  }
}
