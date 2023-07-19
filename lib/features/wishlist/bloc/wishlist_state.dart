part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState {}

abstract class WishlistActionState extends WishlistState {}

class WishlistInitial extends WishlistState {}

class WishlistSuccessState extends WishlistState {
  // ignore: non_constant_identifier_names
  final List<ProductDataModel> WishlistItems;

  // ignore: non_constant_identifier_names
  WishlistSuccessState({required this.WishlistItems});
}

class WishlistItemRemoveStateForScaffoldMessenger extends WishlistActionState {}
