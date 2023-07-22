part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  final List<ProductDataModel> products;
  final List<ProductDataModel> recommendedProducts;
  final List<ProductDataModel> jewelleryProducts;
  final List<ProductDataModel> electronicProducts;
  final List<ProductDataModel> jacketsforwomenProducts;
  final List<ProductDataModel> tshirtsforwomenProducts;

  HomeLoadedSuccessState({required this.products})
      : recommendedProducts = products.sublist(0, 4),
        jewelleryProducts = products.sublist(4, 8),
        electronicProducts = products.sublist(8, 14),
        jacketsforwomenProducts = products.sublist(14, 17),
        tshirtsforwomenProducts = products.sublist(17, products.length);
}

class HomeErrorState extends HomeState {}

class HomeNavigateToWishlistPageActionState extends HomeActionState {}

class HomeNavigateToCartPageActionState extends HomeActionState {}

class HomeProductItemAddToWishlistActionState extends HomeActionState {}

class HomeProductItemAddToCartActionState extends HomeActionState {}
