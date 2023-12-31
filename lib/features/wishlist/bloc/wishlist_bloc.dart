import 'dart:async';

import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:shopping_app_using_blc/data/wishlist_items.dart';
import 'package:shopping_app_using_blc/features/home/models/home_product_data_modal.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishlistItemRemoveEvent>(wishlistItemRemoveEvent);
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
}
