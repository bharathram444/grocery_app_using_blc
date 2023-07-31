import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopping_app_using_blc/data/cart_items.dart';
import 'package:shopping_app_using_blc/data/wishlist_items.dart';
import 'package:shopping_app_using_blc/features/home/models/home_product_data_modal.dart';
import 'package:shopping_app_using_blc/features/home/models/product_data_modal_full_details.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartItemRemoveEvent>(cartItemRemoveEvent);
    on<CartItemRemoveAndAddToWishlistEvent>(
        cartItemRemoveAndAddToWishlistEvent);
    on<CartItemIncrementEvent>(cartItemIncrementEvent);
    on<CartItemDecrementEvent>(cartItemDecrementEvent);
  }

  FutureOr<void> cartInitialEvent(
    CartInitialEvent event,
    Emitter<CartState> emit,
    // CartItemIncrementEvent itemIncrementEvent,
  ) {
    emit(CartSuccessState(CartItems: cartItems));
  }

  FutureOr<void> cartItemRemoveEvent(
      CartItemRemoveEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.productDataModel);
    emit(CartSuccessState(CartItems: cartItems));
    emit(CartItemRemoveStateForScaffoldMessenger());
  }

  FutureOr<void> cartItemRemoveAndAddToWishlistEvent(
      CartItemRemoveAndAddToWishlistEvent event, Emitter<CartState> emit) {
    // ProductDataModelForFullDetails to Convert ProductDataModel
    // ProductDataModel fullDetailstoProductDataModel =
    //     ProductDataModel.fromProductDataModelForFullDetails(event.moveProduct);
    //wishListItems.add(fullDetailstoProductDataModel);
    cartItems.remove(event.moveProduct);
    emit(CartSuccessState(CartItems: cartItems));
    emit(CartItemRemoveAndAddToWishlistStateForScaffoldMessenger());
  }

  FutureOr<void> cartItemIncrementEvent(
      CartItemIncrementEvent event, Emitter<CartState> emit) {
    cartItems.add(event.incrementproduct);
    emit(CartSuccessState(CartItems: cartItems));
  }

  FutureOr<void> cartItemDecrementEvent(
      CartItemDecrementEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.decrementproduct);
    emit(CartSuccessState(CartItems: cartItems));
  }
}
