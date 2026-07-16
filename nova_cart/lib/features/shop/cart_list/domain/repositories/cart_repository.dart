

import 'package:nova_cart/features/shop/cart_list/domain/entities/cart_entity.dart';

abstract interface class CartRepository {

  Stream<List<CartEntity>> getCartItems();

  Future<void> incrementItem(String id);

  Future<void> decrementItem(String id);

  Future<void> removeItem(String id);
  
}