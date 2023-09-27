import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';


class AdminOrderCard extends StatelessWidget {
  final OrdersHistoryUserInfoModel ordersHistoryUserInfoModel;
  final Widget widget;

  const AdminOrderCard({
    required this.ordersHistoryUserInfoModel,
    required this.widget,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Card(
      shadowColor: AppColors.lightGrey,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(AppDimens.radius_16),
        ),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: AppDimens.padding_20,
        vertical: AppDimens.padding_10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            ordersHistoryUserInfoModel.userModel.email,
          ),
          const SizedBox(height: AppDimens.size_10),
          Text(
            DateFormat('dd/MM/yyyy hh:mm').format(
              ordersHistoryUserInfoModel.ordersHistoryModel.dateTime,
            ),
          ),
        ],
      ),
    );
  }
}
