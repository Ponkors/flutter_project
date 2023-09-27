import 'package:domain/domain.dart';

class AddCartDishUseCase implements FutureUseCase<AddToCartParameters, void> {
  final CartRepository _cartRepository;

  AddCartDishUseCase({
    required CartRepository cartRepository,
  }) : _cartRepository = cartRepository;

  @override
  Future<void> execute(AddToCartParameters addToCartParameters) async {
    return _cartRepository.addDishToCart(
      dish: addToCartParameters.dish,
      userId: addToCartParameters.userId,
    );
  }
}

class AddToCartParameters {
  final DishModel dish;
  final String userId;

  const AddToCartParameters({
    required this.dish,
    required this.userId,
  });
}