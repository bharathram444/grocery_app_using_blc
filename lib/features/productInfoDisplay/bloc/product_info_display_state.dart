part of 'product_info_display_bloc.dart';

@immutable
abstract class ProductInfoDisplayState {}

abstract class ProductInfoDisplayActionState extends ProductInfoDisplayState {}

class ProductInfoDisplayInitial extends ProductInfoDisplayState {}

class ProductInfoDisplayLoadingState extends ProductInfoDisplayState {}

// ignore: must_be_immutable
class ProductInfoDisplayLoadedSuccessState extends ProductInfoDisplayState {
  ProductDataModelForFullDetails productInfoDisplayProduct;
  ProductInfoDisplayLoadedSuccessState(
      {required this.productInfoDisplayProduct});
}

class ProductInfoDisplayToCartPageActionState
    extends ProductInfoDisplayActionState {}
