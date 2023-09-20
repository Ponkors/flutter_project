import 'package:domain/domain.dart';
import 'package:domain/repositories/cart_repository.dart';

class GetCartDishesUseCase implements FutureUseCase<NoParams, List<CartDish>>{
  final CartRepository _cartRepository;

  GetCartDishesUseCase({
    required CartRepository cartRepository,
  }) : _cartRepository = cartRepository;

  @override
  Future<List<CartDish>> execute(NoParams input) async {
    return _cartRepository.getDishesFromCart();
  }
}