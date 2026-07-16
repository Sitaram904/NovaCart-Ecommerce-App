

sealed class ProductEvent {}

class LoadProductEvent extends ProductEvent{}
class FavourateItemEvent extends ProductEvent{
  final bool favorite ;
  final String? productId;
  FavourateItemEvent({required this.favorite,required this.productId});
}

