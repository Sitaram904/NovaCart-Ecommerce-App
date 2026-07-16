import 'package:equatable/equatable.dart';

import '../../domain/entities/cart_entity.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

/// Start listening to Firestore cart stream
final class CartStarted extends CartEvent {
  const CartStarted();
}

/// Firestore emits new cart data
final class CartUpdated extends CartEvent {
  final List<CartEntity> cartItems;

  const CartUpdated(this.cartItems);

  @override
  List<Object?> get props => [cartItems];
}

/// Increase quantity
final class CartIncrementPressed extends CartEvent {
  final String cartId;

  const CartIncrementPressed(this.cartId);

  @override
  List<Object?> get props => [cartId];
}

/// Decrease quantity
final class CartDecrementPressed extends CartEvent {
  final String cartId;

  const CartDecrementPressed(this.cartId);

  @override
  List<Object?> get props => [cartId];
}

/// Delete one item
final class CartRemovePressed extends CartEvent {
  final String cartId;

  const CartRemovePressed(this.cartId);

  @override
  List<Object?> get props => [cartId];
}

/// Add product
final class CartAddPressed extends CartEvent {
  final CartEntity cart;

  const CartAddPressed(this.cart);

  @override
  List<Object?> get props => [cart];
}

/// Remove all products
final class CartClearPressed extends CartEvent {
  const CartClearPressed();
}