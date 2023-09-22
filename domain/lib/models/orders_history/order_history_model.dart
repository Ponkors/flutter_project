import 'package:domain/domain.dart';

class OrdersHistoryModel {
  final CartModel cart;
  final DateTime dateTime;
  final String id;

  const OrdersHistoryModel({
    required this.cart,
    required this.dateTime,
    required this.id,
  });

  OrdersHistoryModel copyWith({
    CartModel? cart,
    DateTime? dateTime,
    String? id,
  }) {
    return OrdersHistoryModel(
      cart: cart ?? this.cart,
      dateTime: dateTime ?? this.dateTime,
      id: id ?? this.id,
    );
  }
}