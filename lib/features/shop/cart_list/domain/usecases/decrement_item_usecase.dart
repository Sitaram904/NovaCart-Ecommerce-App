
import 'package:nova_cart/features/shop/cart_list/domain/repositories/cart_repository.dart';

class DecrementItemUseCase {
  final CartRepository repository;
  const DecrementItemUseCase({required this.repository});

  Future<void> call(String id){
    return  repository.decrementItem(id);
  }
}