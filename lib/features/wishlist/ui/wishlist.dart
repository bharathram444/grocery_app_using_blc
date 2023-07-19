import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app_using_blc/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:shopping_app_using_blc/features/wishlist/ui/wishlist_title_widget.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  final WishlistBloc wishlistBloc = WishlistBloc();
  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[200],
        title: const Text('Wishlist Items'),
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listenWhen: (previous, current) => current is WishlistActionState,
        buildWhen: (previous, current) => current is! WishlistActionState,
        listener: (context, state) {
          if (state is WishlistItemRemoveStateForScaffoldMessenger) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Item Removed from Wishlist !'),
              duration: Duration(seconds: 1),
            ));
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishlistSuccessState:
              final successState = state as WishlistSuccessState;
              return Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://images.squarespace-cdn.com/content/v1/5aa5a05cfcf7fd70d5c3b558/1521246372456-TKBYGGL86AFJZZZU8O6H/Artboard+2+copy+2%402x.png?format=2500w'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: ListView.builder(
                    itemCount: successState.WishlistItems.length,
                    itemBuilder: (context, index) {
                      return WishlistTileWidget(
                        productDataModel: successState.WishlistItems[index],
                        wishlistBloc: wishlistBloc,
                      );
                    }),
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
