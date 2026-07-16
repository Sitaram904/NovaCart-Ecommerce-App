

import 'package:nova_cart/core/common/models/product_model.dart';

class  ProductState {
  final List<ProductModel> products;
  final bool isLoading;
  final bool? isfavoriate;
  ProductState({this.products =const [] ,this.isLoading=false,this.isfavoriate});
  ProductState copyWith({
      final List<ProductModel>? products,
      final bool? isfavoriate,
  final bool? isLoading
  }){
    
    return ProductState(products:products??this.products,isfavoriate: isfavoriate??this.isfavoriate, isLoading: isLoading??this.isLoading);
  }
}
