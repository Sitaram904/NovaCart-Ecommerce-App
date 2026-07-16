
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';


class AddToCartServer {

 static final FirebaseFirestore   _firestore = FirebaseFirestore.instance;
 static final  _authId = FirebaseAuth.instance.currentUser!.uid;
  static  Future<void> addProducts({

  final String? id,
  required final String productName ,
  required final String prodDescription,
  required final double productPrice,
  required final String category,
  required final List<String> colors,
  required final List<String> productImageUrl,
  final bool? favoriteProduct,
  final int? stock,
  final double? rating,
  final int? review,
  final int? itemCount

  }) async {
   
    await _firestore.collection("Users").doc(_authId).collection("cartCollection").doc(id).set({
      "id": id,
      "itemCount":itemCount ,
      "color":colors,
      "createdAt": Timestamp.now(),
      "productImageUrl":productImageUrl,
      "productName": productName,
      "productPrice": productPrice,
      "favoriteProduct": favoriteProduct,
      "prodDescription": prodDescription,
      "stock": stock,
      "category": category,
      "rating": rating,
      "review": review,
    });
   
   debugPrint('is this have ct: $category');

  }

}