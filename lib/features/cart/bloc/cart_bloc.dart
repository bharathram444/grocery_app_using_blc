import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopping_app_using_blc/data/cart_items.dart';
import 'package:shopping_app_using_blc/features/home/models/home_product_data_modal.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartItemRemoveEvent>(cartItemRemoveEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(CartItems: cartItems));
  }

  FutureOr<void> cartItemRemoveEvent(
      CartItemRemoveEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.productDataModel);
    emit(CartSuccessState(CartItems: cartItems));
    emit(CartItemRemoveStateForScaffoldMessenger());
  }
}
