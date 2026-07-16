
import 'package:equatable/equatable.dart';

class CartEntity extends Equatable {

 final String id;
  final String productName;
  final String category;
  final double price;
  final List<String> images;
  final int quantity;

  const CartEntity({
    required this.id,
    required this.productName,
    required this.category,
    required this.price,
    required this.images,
    required this.quantity,
  });


@override
List<Object?> get props =>[
       id,
        productName,
        category,
        price,
        images,
        quantity,
];

}