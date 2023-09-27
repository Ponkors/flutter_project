import 'dart:io';

import 'package:domain/domain.dart';

abstract class AdminPanelRepository {
  Future<void> updateProduct({
    required DishModel dishModel,
  });
  Future<List<UserModel>> fetchAllUsers();
  Future<void> updateUserRole({
    required String uid,
    required String role,
  });
  Future<List<OrdersHistoryUserInfoModel>> fetchAllOrders();
  Future<void> deleteProduct({
    required String id,
  });
  Future<void> updateOrderStatus({
    required String uid,
    required bool isReady,
  });
}