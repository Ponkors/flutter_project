import 'package:data/data.dart';
import 'dart:io';

abstract class FirebaseFirestoreDataProvider {
  Future<List<DishEntity>> getAllDishes();
  Future<void> addOrder(OrdersHistoryEntity ordersHistoryEntity);
  Future<List<OrdersHistoryEntity>> fetchOrders(String uid);
  //---------------------------------------------------------------------------
  Future<List<OrdersHistoryUserInfoEntity>> fetchAllOrders();
  //---------------------------------------------------------------------------
  Future<void> deleteDish({
    required String id,
  });
  Future<void> updateDish({
    required DishEntity dishEntity,
  });
  Future<void> updateOrderStatus({
    required String uid,
    required bool isReady,
  });
  //---------------------------------------------------------------------------
  Future<List<UserEntity>> fetchAllUsers();
  Future<void> updateUserRole({
    required String uid,
    required String role,
  });
  Future<UserEntity> getUser({
    required String uid,
  });
  Future<void> saveUser({
    required String uid,
    required String? userName,
    required String? email,
  });
}