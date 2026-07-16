
import 'package:nova_cart/features/shop/cart_list/domain/repositories/cart_repository.dart';

class RemoveCartItemUseCase {
  final CartRepository repository;
  const RemoveCartItemUseCase({required this.repository});

  Future<void> call(String id){
    return repository.removeItem(id);
  }
}