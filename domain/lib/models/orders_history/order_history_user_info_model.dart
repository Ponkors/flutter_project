import 'package:domain/domain.dart';

class OrdersHistoryUserInfoModel {
  final UserModel userModel;
  final OrdersHistoryModel ordersHistoryModel;

  const OrdersHistoryUserInfoModel({
    required this.userModel,
    required this.ordersHistoryModel,
  });

  OrdersHistoryUserInfoModel copyWith({
    UserModel? userModel,
    OrdersHistoryModel? ordersHistoryModel,
  }) {
    return OrdersHistoryUserInfoModel(
      userModel: userModel ?? this.userModel,
      ordersHistoryModel: ordersHistoryModel ?? this.ordersHistoryModel,
    );
  }
}