import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String? id;
  final String productName;
  final String prodDescription;
  final double productPrice;
  final String category;
  final List<String> colors;
  final List<String> productImageUrl;
  final bool? favoriteProduct;
  final int? stock;
  final double? rating;
  final int? review;
  final DateTime? createdAt;

  ProductModel({
    required this.id,
    required this.productName,
    required this.prodDescription,
    required this.productPrice,
    required this.category,
    required this.colors,
    required this.productImageUrl,
    required this.favoriteProduct,
    required this.stock,
    required this.rating,
    this.createdAt,
    this.review,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
       id: json['id'] ?? '',
    
    productImageUrl: List<String>.from(json['productImageUrl'] ?? []),
    
    colors: List<String>.from(json['color'] ?? []),
    
    productName: json['productName'] ?? '',
    
    productPrice: (json['productPrice'] ?? 0).toDouble(),
    
    favoriteProduct: json['favoriteProduct'] ?? false,
    
    prodDescription: json['prodDescription'] ?? '',
    
    category: json['category'] ?? '',   // 👈 IMPORTANT (your category key)
    
    stock: json['stock'] ?? 0,
    
    rating: (json['rating'] ?? 0).toDouble(),
    
    review: json['review'] ?? 0,
    
    createdAt: json['createdAt'] != null
        ? (json['createdAt'] as Timestamp).toDate()
        : null,
  );
  }

  ProductModel copyWith({
    final String? id,
    final String? productName,
    final String? prodDescription,
    final double? productPrice,
    final String? category,
    final List<String>? productImageUrl,
    final bool? favoriteProduct,
    final int? stock,
    final double? rating,
    final int? review,
    final DateTime? createdAt,
    final List<String>? colors
  }) {
    return ProductModel(
      colors: colors??this.colors,
      productImageUrl: productImageUrl ?? this.productImageUrl,
      productName: productName ?? this.productName,
      productPrice: productPrice ?? this.productPrice,
      favoriteProduct: favoriteProduct ?? this.favoriteProduct,
      id: id ?? this.id,
      prodDescription: prodDescription ?? this.prodDescription,
      category: category ?? this.category,
      stock: stock ?? this.stock,
      rating: rating ?? this.rating,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
