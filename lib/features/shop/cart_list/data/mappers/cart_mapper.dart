
import 'package:nova_cart/features/shop/cart_list/data/models/cart_model.dart';
import 'package:nova_cart/features/shop/cart_list/domain/entities/cart_entity.dart';

extension CartModelMapper on CartModel{
  CartEntity toEntity(){
    return CartEntity(

      id: id, 
      productName: productName, 
      category: category,
      price: price, 
      images: images, 
      quantity: quantity

      );
  }
  
}

extension CartEntityMapper on CartEntity{
  CartModel toModel(){
    return CartModel(
      
      id: id, 
      productName: productName, 
      category: category, 
      price: price, 
      images: images, 
      quantity: quantity

      );
  }
}