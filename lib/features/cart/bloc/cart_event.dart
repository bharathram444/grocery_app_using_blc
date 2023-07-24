part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartItemRemoveEvent extends CartEvent {
  final ProductDataModel productDataModel;

  CartItemRemoveEvent({required this.productDataModel});
}

class CartItemRemoveAndAddToWishlistEvent extends CartEvent {
  final ProductDataModel productDataModel;

  CartItemRemoveAndAddToWishlistEvent({required this.productDataModel});
}
