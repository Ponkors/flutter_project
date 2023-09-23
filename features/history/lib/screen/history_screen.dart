import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:navigation/navigation.dart';
import 'package:history/history.dart';
import 'package:flutter/material.dart';

class OrdersHistoryScreen extends StatelessWidget {
  const OrdersHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'menuPage.orderHistory'.tr(),
      ),
      body: BlocBuilder<OrdersHistoryBloc, OrdersHistoryState>(
        builder: (_, OrdersHistoryState state) {
          if (state.isLoading) {
            return const LoadingIndicator();
          }
          if (state.orderItems.isNotEmpty) {
            return Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    itemCount: state.orderItems.length,
                    itemBuilder: (_, index) {
                      return OrdersHistoryItem(
                        ordersHistoryItem: state.orderItems[index],
                      );
                    },
                  ),
                ),
              ],
            );
          } else {
            return OrdersHistoryEmpty(
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
