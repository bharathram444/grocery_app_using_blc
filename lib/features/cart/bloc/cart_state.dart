part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

abstract class CartActionState extends CartState {}

class CartInitial extends CartState {}

// ignore: must_be_immutable
class CartSuccessState extends CartState {
  // ignore: non_constant_identifier_names
  List<ProductDataModel> CartItems;

  // ignore: non_constant_identifier_names
  CartSuccessState({required this.CartItems});

  // Method to get a list of unique ProductDataModel objects based on their IDs
  List<ProductDataModel> getUniqueProducts() {
    Set<int> uniqueIds = {};
    List<ProductDataModel> uniqueProducts = [];

    for (var item in CartItems) {
      if (!uniqueIds.contains(item.id)) {
        uniqueIds.add(item.id);
        uniqueProducts.add(item);
      }
    }

    return uniqueProducts;
  }
}

class CartItemRemoveStateForScaffoldMessenger extends CartActionState {}

class CartItemRemoveAndAddToWishlistStateForScaffoldMessenger
    extends CartActionState {}
