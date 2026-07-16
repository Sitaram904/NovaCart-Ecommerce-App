

import '../models/cart_model.dart';

abstract interface class CartRemoteDataSource {
  Stream<List<CartModel>> getCartItems();

  Future<void> incrementItem(String id);

  Future<void> decrementItem(String id);

  Future<void> removeItem(String id);

  Future<void> addToCart(CartModel cart);

}