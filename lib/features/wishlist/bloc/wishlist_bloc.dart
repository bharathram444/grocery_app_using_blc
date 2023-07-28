import 'dart:async';

import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:shopping_app_using_blc/data/cart_items.dart';
import 'package:shopping_app_using_blc/data/wishlist_items.dart';
import 'package:shopping_app_using_blc/features/home/models/home_product_data_modal.dart';
import 'package:shopping_app_using_blc/features/home/models/product_data_modal_full_details.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishlistItemRemoveEvent>(wishlistItemRemoveEvent);
    on<WishlistItemRemoveAndAddToCartEvent>(
        wishlistItemRemoveAndAddToCartEvent);
  }

  FutureOr<void> wishlistInitialEvent(
      WishlistInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishlistSuccessState(WishlistItems: wishListItems));
  }

  FutureOr<void> wishlistItemRemoveEvent(
      WishlistItemRemoveEvent event, Emitter<WishlistState> emit) {
    wishListItems.remove(event.productDataModel);
    emit(WishlistSuccessState(WishlistItems: wishListItems));
    emit(WishlistItemRemoveStateForScaffoldMessenger());
  }

  FutureOr<void> wishlistItemRemoveAndAddToCartEvent(
      WishlistItemRemoveAndAddToCartEvent event, Emitter<WishlistState> emit) {
    // Convert ProductDataModel to ProductDataModelForFullDetails
    ProductDataModelForFullDetails fullDetails =
        ProductDataModelForFullDetails.fromProductDataModel(
            event.productDataModel);
    cartItems.add(fullDetails);
    wishListItems.remove(event.productDataModel);
    emit(WishlistSuccessState(WishlistItems: wishListItems));
    emit(WishlistItemRemoveAndAddToCartStateForScaffoldMessenger());
  }
}
