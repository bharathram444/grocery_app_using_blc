part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistEvent {}

class WishlistInitialEvent extends WishlistEvent {}

class WishlistItemRemoveEvent extends WishlistEvent {
  // ignore: non_constant_identifier_names
  final ProductDataModel productDataModel;

  // ignore: non_constant_identifier_names
  WishlistItemRemoveEvent({required this.productDataModel});
}
