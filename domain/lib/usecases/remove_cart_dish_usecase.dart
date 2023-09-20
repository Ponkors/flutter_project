import 'package:domain/domain.dart';
import 'package:domain/repositories/cart_repository.dart';

class RemoveCartDishUseCase implements FutureUseCase<CartDish, void> {
  final CartRepository _cartRepository;

  RemoveCartDishUseCase({
    required CartRepository cartRepository,
  }) : _cartRepository = cartRepository;

  @override
  Future<void> execute(CartDish cartDish) async {
    return _cartRepository.removeDishFromCart(cartDish);
  }
}