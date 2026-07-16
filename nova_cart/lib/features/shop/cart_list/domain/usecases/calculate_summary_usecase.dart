
import 'package:nova_cart/features/shop/cart_list/domain/entities/cart_entity.dart';
import 'package:nova_cart/features/shop/cart_list/domain/entities/cart_summary_entity.dart';
import 'package:nova_cart/features/shop/cart_list/domain/services/cart_summary_calculator.dart';

class CalculateSummaryUseCase {
  final CartSummaryCalculator calculator;
  const CalculateSummaryUseCase({required this.calculator});

  CartSummaryEntity call(List<CartEntity> cartItems){
    return calculator.calculate(cartItems);
  }
  
}