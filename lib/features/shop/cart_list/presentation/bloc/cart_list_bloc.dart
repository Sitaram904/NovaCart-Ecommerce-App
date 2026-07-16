import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_cart/features/shop/cart_list/data/exceptions/cart_exceptions.dart';

import '../../domain/entities/cart_entity.dart';
import '../../domain/usecases/calculate_summary_usecase.dart';
import '../../domain/usecases/decrement_item_usecase.dart';
import '../../domain/usecases/get_cart_usecase.dart';
import '../../domain/usecases/increment_item_usecase.dart';
import '../../domain/usecases/remove_cart_item_usecase.dart';

import 'cart_list_event.dart';
import 'cart_list_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {

  final GetCartUseCase getCartUseCase;

  final IncrementItemUseCase incrementItemUseCase;

  final DecrementItemUseCase decrementItemUseCase;

  final RemoveCartItemUseCase removeCartItemUseCase;

  final CalculateSummaryUseCase calculateSummaryUseCase;

  StreamSubscription<List<CartEntity>>? _cartSubscription;

  CartBloc({
    required this.getCartUseCase,
    required this.incrementItemUseCase,
    required this.decrementItemUseCase,
    required this.removeCartItemUseCase,
    required this.calculateSummaryUseCase,
  }) : super(CartState.initial()) {
    on<CartStarted>(_onStarted);

    on<CartUpdated>(_onUpdated);

    on<CartIncrementPressed>(_onIncrement);

    on<CartDecrementPressed>(_onDecrement);

    on<CartRemovePressed>(_onRemove);

  }

  Future<void> _onStarted(
  CartStarted event,
  Emitter<CartState> emit,
) async {
  emit(
    state.copyWith(
      status: CartStatus.loading,
    ),
  );

  await _cartSubscription?.cancel();

  _cartSubscription = getCartUseCase().listen(
    (cartItems) {
      add(CartUpdated(cartItems));
    },
  );
}

Future<void> _onUpdated(
  CartUpdated event,
  Emitter<CartState> emit,
) async {
  final summary =
      calculateSummaryUseCase(event.cartItems);

  emit(
    state.copyWith(
      status: CartStatus.success,
      cartItems: event.cartItems,
      summary: summary,
    ),
  );
}

Future<void> _onIncrement(
  CartIncrementPressed event,
  Emitter<CartState> emit,
) async {
  await incrementItemUseCase(event.cartId);
}

Future<void> _onDecrement(
  CartDecrementPressed event,
  Emitter<CartState> emit,
) async {
  try{
  await decrementItemUseCase(event.cartId);

  }on MiniumQuantityException {
    emit(state.copyWith(errorMessage:'Minimum 1 item!'));

  }
}

Future<void> _onRemove(
  CartRemovePressed event,
  Emitter<CartState> emit,
) async {
  await removeCartItemUseCase(event.cartId);
}

}