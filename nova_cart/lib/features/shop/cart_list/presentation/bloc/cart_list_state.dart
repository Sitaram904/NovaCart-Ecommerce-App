import 'package:equatable/equatable.dart';

import '../../domain/entities/cart_entity.dart';
import '../../domain/entities/cart_summary_entity.dart';

enum CartStatus {
  initial,
  loading,
  success,
  failure,
}

class CartState extends Equatable {
  final CartStatus status;

  final List<CartEntity> cartItems;

  final CartSummaryEntity summary;

  final String? errorMessage;

  const CartState({
    this.status = CartStatus.initial,
    this.cartItems = const [],
    required this.summary,
    this.errorMessage,
  });

  factory CartState.initial() {
    return CartState(
      summary: CartSummaryEntity.empty(),
    );
  }

  CartState copyWith({
    CartStatus? status,
    List<CartEntity>? cartItems,
    CartSummaryEntity? summary,
    String? errorMessage,
  }) {
    return CartState(
      status: status ?? this.status,
      cartItems: cartItems ?? this.cartItems,
      summary: summary ?? this.summary,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        cartItems,
        summary,
        errorMessage,
      ];
}




 