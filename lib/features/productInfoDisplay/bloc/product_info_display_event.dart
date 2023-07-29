part of 'product_info_display_bloc.dart';

@immutable
abstract class ProductInfoDisplayEvent {}

class ProductInfoDisplayInitialEvent extends ProductInfoDisplayEvent {}

class ProductInfoDisplayToCartNavigateEvent extends ProductInfoDisplayEvent {}

// ignore: must_be_immutable
class AddToCartEvent extends ProductInfoDisplayEvent {
  final ProductDataModelForFullDetails clickedProduct;

  AddToCartEvent({required this.clickedProduct});
}
