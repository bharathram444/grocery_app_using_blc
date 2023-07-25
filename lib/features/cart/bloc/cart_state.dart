part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

abstract class CartActionState extends CartState {}

class CartInitial extends CartState {}

class CartSuccessState extends CartState {
  // ignore: non_constant_identifier_names
  List<ProductDataModel> CartItems;

  // Regular constructor
  // ignore: non_constant_identifier_names
  CartSuccessState({required this.CartItems});

  // Static property to hold the unique list
  static List<ProductDataModel> get uniqueCartItems {
    List<ProductDataModel> uniqueItems = removeDuplicateItems([]);
    return uniqueItems;
  }

  // Factory constructor to compute uniqueCartItems
  factory CartSuccessState.withUniqueItems(List<ProductDataModel> cartItems) {
    List<ProductDataModel> uniqueItems = removeDuplicateItems(cartItems);
    return CartSuccessState(CartItems: cartItems); // Use the original cartItems
  }

  // Function to filter out items with the same 'id'
  static List<ProductDataModel> removeDuplicateItems(
      List<ProductDataModel> list) {
    Map<int, bool> idMap = {};
    List<ProductDataModel> uniqueList = [];

    for (var item in list) {
      if (!idMap.containsKey(item.id)) {
        idMap[item.id] = true;
        uniqueList.add(item);
      }
    }

    return uniqueList;
  }
}

class CartItemRemoveStateForScaffoldMessenger extends CartActionState {}

class CartItemRemoveAndAddToWishlistStateForScaffoldMessenger
    extends CartActionState {}
