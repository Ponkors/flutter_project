import 'package:core/core.dart';
import 'package:data/data.dart';

class OrdersHistoryEntity {
  final CartEntity cart;
  final DateTime dateTime;
  final String id;

  OrdersHistoryEntity({
    required this.cart,
    required this.dateTime,
    required this.id,
  });

  List<Object?> get props => [
    cart,
    dateTime,
    id,
  ];

  Map<String, dynamic> toJson() {
    return {
    'cart': cart,
    'dateTime': dateTime,
    'id': id,
    };
  }

  factory OrdersHistoryEntity.fromJson(
    Map<String, dynamic> json,
  ) {
    return OrdersHistoryEntity(
      cart: CartEntity.fromJson(json['cart']),
      dateTime: (json['dateTime'] as Timestamp).toDate(),
      id: json['id'] ?? '',
    );
  }

  factory OrdersHistoryEntity.fromFirebase(
      DocumentSnapshot<Map<String, dynamic>> document,
      ) {
    final Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    return OrdersHistoryEntity.fromJson(data);
  }
}