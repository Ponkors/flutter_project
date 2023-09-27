import 'package:domain/domain.dart';

abstract class CartRepository {
  Future<List<CartDish>> getDishesFromCart({
    required String userId,
  });
  Future<void> addDishToCart({
    required DishModel dish,
    required String userId,
  });
  Future<void> removeDishFromCart({
    required CartDish cart,
    required String userId,
  });
  Future<void> clearCart({
    required String userId,
  });
}