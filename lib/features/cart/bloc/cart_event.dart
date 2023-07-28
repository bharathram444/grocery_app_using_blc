part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartItemRemoveEvent extends CartEvent {
  final ProductDataModelForFullDetails productDataModel;

  CartItemRemoveEvent({required this.productDataModel});
}

class CartItemRemoveAndAddToWishlistEvent extends CartEvent {
  final ProductDataModelForFullDetails moveProduct;

  CartItemRemoveAndAddToWishlistEvent({required this.moveProduct});
}

// ignore: must_be_immutable
class CartItemIncrementEvent extends CartEvent {
  final ProductDataModelForFullDetails incrementproduct;
  CartItemIncrementEvent({required this.incrementproduct});
}

// ignore: must_be_immutable
class CartItemDecrementEvent extends CartEvent {
  final ProductDataModelForFullDetails decrementproduct;

  CartItemDecrementEvent({required this.decrementproduct});
}
