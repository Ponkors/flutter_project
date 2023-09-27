import 'package:domain/domain.dart';

class OrdersHistoryModel {
  final CartModel cart;
  final DateTime dateTime;
  final String id;
  final bool isReady;

  const OrdersHistoryModel({
    required this.cart,
    required this.dateTime,
    required this.id,
    required this.isReady,
  });

  OrdersHistoryModel copyWith({
    CartModel? cart,
    DateTime? dateTime,
    String? id,
    bool? isReady,
  }) {
    return OrdersHistoryModel(
      cart: cart ?? this.cart,
      dateTime: dateTime ?? this.dateTime,
      id: id ?? this.id,
      isReady: isReady ?? this.isReady,
    );
  }
}