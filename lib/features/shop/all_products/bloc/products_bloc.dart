
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_cart/core/common/models/product_model.dart';
import 'package:nova_cart/features/shop/all_products/bloc/product_event.dart';
import 'package:nova_cart/features/shop/all_products/bloc/product_state.dart';

class ProductsBloc extends Bloc<ProductEvent,ProductState> {
 
 ProductsBloc():super(ProductState()){
  on<LoadProductEvent>((event, emit)async {
    emit(state.copyWith(isLoading:true));
    final  products = await Services.getProducts() ;
    emit(state.copyWith(products:products,isLoading: false));
  },);

  on<FavourateItemEvent>((event,emit)async{
      await Services.updateProducts(event.productId,event.favorite);
      add(LoadProductEvent());
  }); 
 }

}


class Services{
  Services._();
 static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static Future<List<ProductModel>> getProducts()async{
    final snapshot = await _firestore.collection("allProducts")
    .get();
    return  snapshot.docs.
    map((doc){
      return ProductModel.fromJson(doc.data());
    }).toList();
  }

  static Future<void> updateProducts(String? productId,bool isfaurite)async{
  try{
await _firestore.collection("allProducts").doc(productId).
update({
     "favoriteProduct" :!isfaurite 
    });
  }catch(e){
    debugPrint(e.toString());
  }
   
    
  }



}

