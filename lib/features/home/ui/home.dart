import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app_using_blc/features/cart/ui/cart.dart';
import 'package:shopping_app_using_blc/features/home/bloc/home_bloc.dart';
import 'package:shopping_app_using_blc/features/home/ui/product_tile_widget.dart';
import 'package:shopping_app_using_blc/features/wishlist/ui/wishlist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Cart()),
          );
        } else if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const WishList()),
          );
        } else if (state is HomeProductItemAddToWishlistActionState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Added to Wishlist !'),
            duration: Duration(seconds: 1),
          ));
        } else if (state is HomeProductItemAddToCartActionState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Added to Cart !'),
            duration: Duration(seconds: 1),
          ));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.purple[200],
                  title: const Text('Grocery App'),
                  actions: [
                    IconButton(
                        onPressed: () {
                          homeBloc.add(HomeWishlistButtonNavigateEvent());
                        },
                        icon: const Icon(Icons.favorite)),
                    IconButton(
                        onPressed: () {
                          homeBloc.add(HomeCartButtonNavigateEvent());
                        },
                        icon: const Icon(Icons.shopping_cart))
                  ],
                ),
                body: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://images.squarespace-cdn.com/content/v1/5aa5a05cfcf7fd70d5c3b558/1521246372456-TKBYGGL86AFJZZZU8O6H/Artboard+2+copy+2%402x.png?format=2500w'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: ListView.builder(
                      itemCount: successState.products.length,
                      itemBuilder: (context, index) {
                        return ProductTileWidget(
                          productDataModel: successState.products[index],
                          homeBloc: homeBloc,
                        );
                      }),
                ));
          case HomeErrorState:
            return const Scaffold(
              body: Center(
                child: Text('Error'),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
