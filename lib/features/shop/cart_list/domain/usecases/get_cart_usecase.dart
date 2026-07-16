
import 'package:nova_cart/features/shop/cart_list/domain/entities/cart_entity.dart';
import 'package:nova_cart/features/shop/cart_list/domain/repositories/cart_repository.dart';

class GetCartUseCase {
  final CartRepository repository;

  const GetCartUseCase({required this.repository});

  Stream<List<CartEntity>> call(){
    return repository.getCartItems();
  }
  
}