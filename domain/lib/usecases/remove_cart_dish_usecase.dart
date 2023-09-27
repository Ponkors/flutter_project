import 'package:domain/domain.dart';

class RemoveCartDishUseCase implements FutureUseCase<RemoveCartParameters, void> {
  final CartRepository _cartRepository;

  RemoveCartDishUseCase({
    required CartRepository cartRepository,
  }) : _cartRepository = cartRepository;

  @override
  Future<void> execute(RemoveCartParameters removeCartParameters) async {
    return _cartRepository.removeDishFromCart(
      cart: removeCartParameters.cart,
      userId: removeCartParameters.userId,
    );
  }
}

class RemoveCartParameters {
  final CartDish cart;
  final String userId;

  const RemoveCartParameters({
    required this.cart,
    required this.userId,
  });
}