import 'dart:async';

import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:shopping_app_using_blc/data/cart_items.dart';
import 'package:shopping_app_using_blc/data/grocery_data.dart';
import 'package:shopping_app_using_blc/data/wishlist_items.dart';
import 'package:shopping_app_using_blc/features/home/models/home_product_data_modal.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    emit(HomeLoadedSuccessState(
        products: GroceryData.groceryProducts
            .map((e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                discription: e['description'],
                price: e['price'],
                imageUrl: e['imageUrl']))
            .toList()));
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(
      HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    // ignore: avoid_print
    print('Wishlist Navigate clicked !');
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    // ignore: avoid_print
    print('Cart Navigate clicked !');
    emit(HomeNavigateToCartPageActionState());
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    // ignore: avoid_print
    print('Wishlist Product clicked !');
    wishListItems.add(event.clickedProduct);
    emit(HomeProductItemAddToWishlistActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    // ignore: avoid_print
    print('Cart Product clicked !');
    cartItems.add(event.clickedProduct);
    emit(HomeProductItemAddToCartActionState());
  }
}
