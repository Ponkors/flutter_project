import 'package:core/core.dart';
import 'package:data/data.dart';

class OrdersHistoryEntity {
  final CartEntity cart;
  final DateTime dateTime;
  final String id;
  final bool isReady;

  OrdersHistoryEntity({
    required this.cart,
    required this.dateTime,
    required this.id,
    required this.isReady,
  });

  List<Object?> get props => [
    cart,
    dateTime,
    id,
    isReady,
  ];

  Map<String, dynamic> toJson() {
    return {
    'cart': cart,
    'dateTime': dateTime,
    'id': id,
    'isReady': isReady,
    };
  }

  factory OrdersHistoryEntity.fromJson(
    Map<String, dynamic> json,
  ) {
    return OrdersHistoryEntity(
      cart: CartEntity.fromJson(json['cart']),
      dateTime: (json['dateTime'] as Timestamp).toDate(),
      id: json['id'] ?? '',
      isReady: json['isReady'] ?? false,
    );
  }

  factory OrdersHistoryEntity.fromFirebase(
      DocumentSnapshot<Map<String, dynamic>> document,
      ) {
    final Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    return OrdersHistoryEntity.fromJson(data);
  }
}