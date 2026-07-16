import 'package:equatable/equatable.dart';

class CartSummaryEntity extends Equatable {
  final double subtotal;
  final double discount;
  final double deliveryCharge;
  final double total;
  final int totalItems;

  const CartSummaryEntity({
    required this.subtotal,
    required this.discount,
    required this.deliveryCharge,
    required this.total,
    required this.totalItems,
  });

  factory CartSummaryEntity.empty() {
    return const CartSummaryEntity(
      subtotal: 0,
      discount: 0,
      deliveryCharge: 0,
      total: 0,
      totalItems: 0,
    );
  }

  @override
  List<Object?> get props => [
        subtotal,
        discount,
        deliveryCharge,
        total,
        totalItems,
      ];
}