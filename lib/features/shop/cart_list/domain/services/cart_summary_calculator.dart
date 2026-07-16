import '../entities/cart_entity.dart';
import '../entities/cart_summary_entity.dart';

abstract interface class CartSummaryCalculator {
  CartSummaryEntity calculate(List<CartEntity> cartItems);
}

class CartSummaryCalculatorImpl implements CartSummaryCalculator {
  const CartSummaryCalculatorImpl();

  @override
  CartSummaryEntity calculate(List<CartEntity> cartItems) {
    
    final subtotal = _calculateSubtotal(cartItems);

    final totalItems = _calculateTotalItems(cartItems);

    final discount = _calculateDiscount(subtotal);

    final deliveryCharge = _calculateDeliveryCharge(subtotal);

    final total = subtotal - discount + deliveryCharge;

    return CartSummaryEntity(
      subtotal: subtotal,
      discount: discount,
      deliveryCharge: deliveryCharge,
      total: total,
      totalItems: totalItems,
    );
  }

  double _calculateSubtotal(List<CartEntity> items) {
    return items.fold(
      0,
      (previous, item) => previous + (item.price * item.quantity),
    );
  }

  int _calculateTotalItems(List<CartEntity> items) {
    return items.fold(
      0,
      (previous, item) => previous + item.quantity,
    );
  }

  double _calculateDiscount(double subtotal) {
    if (subtotal >= 1000) {
      return subtotal * 0.20;
    }

    if (subtotal >= 500) {
      return subtotal * 0.15;
    }

    if (subtotal >= 200) {
      return subtotal * 0.10;
    }

    return 0;
  }

  double _calculateDeliveryCharge(double subtotal) {
    if (subtotal >= 300) {
      return 0;
    }

    return 5;
  }
}