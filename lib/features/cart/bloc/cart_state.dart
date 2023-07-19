part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

abstract class CartActionState extends CartState {}

class CartInitial extends CartState {}

class CartSuccessState extends CartState {
  // ignore: non_constant_identifier_names
  final List<ProductDataModel> CartItems;

  // ignore: non_constant_identifier_names
  CartSuccessState({required this.CartItems});
}

class CartItemRemoveStateForScaffoldMessenger extends CartActionState {}
