import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nova_cart/features/shop/cart_list/data/exceptions/cart_exceptions.dart';

import '../models/cart_model.dart';
import 'cart_remote_datasource.dart';

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  const CartRemoteDataSourceImpl({
    required this.firestore,
    required this.auth,
  });

  CollectionReference<Map<String, dynamic>> get _cartCollection =>
      firestore
          .collection("Users")
          .doc(auth.currentUser!.uid)
          .collection("cartCollection");

  @override
  Stream<List<CartModel>> getCartItems() {
    return _cartCollection.snapshots().map(
      (snapshot) => snapshot.docs
          .map((doc) => CartModel.fromJson(doc.data()))
          .toList(),
    );
  }

  @override
  Future<void> addToCart(CartModel cart) async {
    await _cartCollection.doc(cart.id).set(cart.toJson());
  }

  @override
  Future<void> incrementItem(String id) async {
    await _cartCollection.doc(id).update({
      "itemCount": FieldValue.increment(1),
    });
  }

  @override
  Future<void> decrementItem(String id) async {
    final document = await _cartCollection.doc(id).get();

    if (!document.exists) return;

    final model = CartModel.fromJson(document.data()!);

    if (model.quantity <= 1) {
          throw MiniumQuantityException();
    }else{
await _cartCollection.doc(id).update({
      "itemCount": FieldValue.increment(-1),
    });
    }

    
  }

  @override
  Future<void> removeItem(String id) async {
    await _cartCollection.doc(id).delete();
  }
  
}