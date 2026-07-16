
import 'package:nova_cart/features/shop/cart_list/data/data_source/cart_remote_datasource.dart';
import 'package:nova_cart/features/shop/cart_list/data/mappers/cart_mapper.dart';

import '../../domain/entities/cart_entity.dart';
import '../../domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource remoteDataSource;

  const CartRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Stream<List<CartEntity>> getCartItems() {
    return remoteDataSource.getCartItems().map(
      (models)=>models.map(
        (e)=>e.toEntity()
        ).toList()
      );
  }


  @override
  Future<void> decrementItem(String id)async {
     return await remoteDataSource.decrementItem(id);
       
  }


  


  @override
  Future<void> removeItem(String id)async {
     return await  remoteDataSource.removeItem(id);
  }
  
  @override
  Future<void> incrementItem(String id) async{
   return await remoteDataSource.incrementItem(id);
  }
}