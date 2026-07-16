
import 'package:nova_cart/features/shop/cart_list/domain/repositories/cart_repository.dart';

class IncrementItemUseCase {
  final CartRepository repository;
  const IncrementItemUseCase({required this.repository});

  Future<void> call(String id){
    return  repository.incrementItem(id); 
  }
}