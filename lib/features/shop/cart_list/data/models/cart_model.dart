class CartModel {
  final String id;
  final String productName;
  final String category;
  final double price;
  final List<String> images;
  final int quantity;

  const CartModel({
    required this.id,
    required this.productName,
    required this.category,
    required this.price,
    required this.images,
    required this.quantity,
  });
  
factory CartModel.fromJson(Map<String, dynamic> json) {
  return CartModel(
    id: json['id'] as String? ?? '',
    productName: json['productName'] as String? ?? '',
    category: json['category'] as String? ?? '',
    price: (json['productPrice'] as num?)?.toDouble() ?? 0.0,
    images: List<String>.from(json['productImageUrl'] ?? []),
    quantity: (json['itemCount'] as num?)?.toInt() ?? 0,
  );
}


  Map<String,dynamic> toJson(){
    return {
      'id': id,
      'productName': productName,
      'category': category,
      'productPrice': price,
      'productImageUrl': images,
      'itemCount': quantity,
    };
  }

  CartModel copyWith({
  final String? id,
  final String? productName,
  final String? category,
  final double? price,
  final List<String>? images,
  final int? quantity,

  }){
    return CartModel(
    id: id??this.id,
    productName: productName??this.productName,
    category: category??this.category,
    price: price??this.price,
    images: images??this.images,
    quantity: quantity??this.quantity);
  }
}