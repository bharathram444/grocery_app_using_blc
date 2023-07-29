import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:shopping_app_using_blc/data/cart_items.dart';
import 'package:shopping_app_using_blc/data/productInfoDisplayData.dart';
//import 'package:shopping_app_using_blc/data/grocery_data.dart';
import 'package:shopping_app_using_blc/data/wishlist_items.dart';
import 'package:shopping_app_using_blc/features/home/models/home_product_data_modal.dart';
import 'package:shopping_app_using_blc/features/home/models/product_data_modal_full_details.dart';
//import 'package:shopping_app_using_blc/features/home/models/product_data_modal_full_details.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);
    //on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<ProductInfoDisplayNavigateEvent>(productInfoDisplayNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 1));

// Function to fetch data from the API
    List<ProductDataModel> products;
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      //List<Post> posts = data.map((item) => Post.fromJson(item)).toList();
      products = data.map((item) => ProductDataModel.fromJson(item)).toList();
      //return posts;
    } else {
      throw Exception('Failed to load data');
    }

    emit(HomeLoadedSuccessState(
        // products: GroceryData.groceryProducts
        //     .map((e) => ProductDataModel(
        //         id: e['id'],
        //         name: e['name'],
        //         discription: e['description'],
        //         price: e['price'],
        //         imageUrl: e['imageUrl']))
        //     .toList()));
        products: products));
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

  // FutureOr<void> homeProductCartButtonClickedEvent(
  //     HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
  //   // // ignore: avoid_print
  //   // print('Cart Product clicked !');
  //   // cartItems.add(event.clickedProduct);
  //   emit(HomeProductItemAddToCartActionState());
  // }

  FutureOr<void> productInfoDisplayNavigateEvent(
      ProductInfoDisplayNavigateEvent event, Emitter<HomeState> emit) {
    ProductDataModelForFullDetails fullDetails =
        ProductDataModelForFullDetails.fromProductDataModel(
            event.infoDisplayProduct);
    emit(HomeNavigateToProductInfoDisplayPageActionState(
      infoDisplayProduct: fullDetails,
    ));
  }
}
// productInfoDisplayData.discription = event.infoDisplayProduct.discription;
    // productInfoDisplayData.price = event.infoDisplayProduct.price;
    // productInfoDisplayData.id = event.infoDisplayProduct.id;
    // productInfoDisplayData.imageUrl = event.infoDisplayProduct.imageUrl;
    // productInfoDisplayData.name = event.infoDisplayProduct.name;
    // productInfoDisplayData.category = event.infoDisplayProduct.category;

    // productInfoDisplayData.rating = event.infoDisplayProduct.rating;
    // productInfoDisplayData.count = event.infoDisplayProduct.count;

    // emit(HomeNavigateToProductInfoDisplayPageActionState()); // Convert ProductDataModel to ProductDataModelForFullDetails