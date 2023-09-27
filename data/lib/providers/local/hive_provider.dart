import 'package:data/data.dart';
import 'package:domain/domain.dart';

abstract class HiveProvider {
  Future<void> saveDishesToCache(List<DishModel> dishes);
  Future<List<DishEntity>> getCachedDishes();
  //---------------------------------------------------------------------------
  Future<void> addDishToCart({
    required DishEntity dish,
    required String userId,
  });
  Future<void> removeDishFromCart({
    required CartDishEntity cartDishEntity,
    required String userId,
  });
  Future<List<CartDishEntity>> getDishesFromCart(String userId);
  Future<void> clearCart(String userId);
  //---------------------------------------------------------------------------
  Future<void> saveOrdersToCache(List<OrdersHistoryModel> orders);
  Future<List<OrdersHistoryEntity>> getCachedOrders();
  Future<void> addOrderToCache(OrdersHistoryModel order);
  //---------------------------------------------------------------------------
  Future<UserEntity> getUserFromLocal();
  Future<void> saveUserToLocal(UserModel userModel);
  Future<void> deleteUserFromLocal();
  //---------------------------------------------------------------------------
  Future<bool> getThemeMode();
  Future<bool> getThemeType();
  Future<void> setThemeMode(bool isDark);
  Future<void> setThemeType(bool systemTheme);
  Future<double> getFontSize();
  Future<void> setFontSize(double textScale);
  //---------------------------------------------------------------------------
}