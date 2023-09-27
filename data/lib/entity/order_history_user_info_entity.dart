import 'package:core/core.dart';
import 'package:data/data.dart';

class OrdersHistoryUserInfoEntity {
  final UserEntity userEntity;
  final OrdersHistoryEntity ordersHistoryEntity;

  const OrdersHistoryUserInfoEntity({
    required this.userEntity,
    required this.ordersHistoryEntity,
  });

  List<Object?> get props => [
    userEntity,
    ordersHistoryEntity,
  ];

  Map<String, dynamic> toJson() {
    return {
      'userEntity': userEntity,
      'ordersHistoryEntity': ordersHistoryEntity,
    };
  }

  factory OrdersHistoryUserInfoEntity.fromJson(
    Map<String, dynamic> json,
  ) {
    return OrdersHistoryUserInfoEntity(
      userEntity: UserEntity.fromJson(json['user']),
      ordersHistoryEntity: OrdersHistoryEntity.fromJson(json['order']),
    );
  }

  factory OrdersHistoryUserInfoEntity.fromFirebase(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    final Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    return OrdersHistoryUserInfoEntity.fromJson(data);
  }
}