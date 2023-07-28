import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:shopping_app_using_blc/data/cart_items.dart';
import 'package:shopping_app_using_blc/data/productInfoDisplayData.dart';
import 'package:shopping_app_using_blc/features/home/models/product_data_modal_full_details.dart';

part 'product_info_display_event.dart';
part 'product_info_display_state.dart';

class ProductInfoDisplayBloc
    extends Bloc<ProductInfoDisplayEvent, ProductInfoDisplayState> {
  ProductInfoDisplayBloc() : super(ProductInfoDisplayInitial()) {
    on<ProductInfoDisplayInitialEvent>(productInfoDisplayInitialEvent);
    on<ProductInfoDisplayToCartNavigateEvent>(
        productInfoDisplayToCartNavigateEvent);
    on<AddToCartEvent>(addToCartEvent);
  }

  FutureOr<void> productInfoDisplayInitialEvent(
      ProductInfoDisplayInitialEvent event,
      Emitter<ProductInfoDisplayState> emit) {
    emit(ProductInfoDisplayLoadedSuccessState(
        productInfoDisplayProduct: productInfoDisplayData));
  }

  FutureOr<void> addToCartEvent(
      AddToCartEvent event, Emitter<ProductInfoDisplayState> emit) {
    // ignore: avoid_print
    print('Cart Product clicked !');
    cartItems.add(event.clickedProduct);
  }

  FutureOr<void> productInfoDisplayToCartNavigateEvent(
      ProductInfoDisplayToCartNavigateEvent event,
      Emitter<ProductInfoDisplayState> emit) {
    // ignore: avoid_print
    print('Cart Navigate clicked !');
    emit(ProductInfoDisplayToCartPageActionState());
  }
}
