import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app_using_blc/data/cart_items.dart';
import 'package:shopping_app_using_blc/features/cart/bloc/cart_bloc.dart';
import 'package:shopping_app_using_blc/features/cart/ui/cart_title_widget.dart';
import 'package:shopping_app_using_blc/features/home/models/home_product_data_modal.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[200],
        title: const Text('Cart Items'),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        listener: (context, state) {
          if (state is CartItemRemoveStateForScaffoldMessenger) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Item Removed From Cart !'),
              duration: Duration(seconds: 1),
            ));
          } else if (state
              is CartItemRemoveAndAddToWishlistStateForScaffoldMessenger) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Item Moved To Wishlist !'),
              duration: Duration(seconds: 1),
            ));
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessState:
              final successState = state as CartSuccessState;
              List<ProductDataModel> uniqueProducts =
                  successState.getUniqueProducts();

              double totalPrice = 0;
              for (var product in successState.CartItems) {
                totalPrice += product.price;
              }
              return Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://images.squarespace-cdn.com/content/v1/5aa5a05cfcf7fd70d5c3b558/1521246372456-TKBYGGL86AFJZZZU8O6H/Artboard+2+copy+2%402x.png?format=2500w'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: uniqueProducts.length,
                            itemBuilder: (context, index) {
                              return CartTileWidget(
                                productDataModel: uniqueProducts[index],
                                cartBloc: cartBloc,
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "\$ $totalPrice",
                            // "\$${totalPrice.toStringAsFixed(2)}",
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            " ${uniqueProducts.length}",
                            // "\$${totalPrice.toStringAsFixed(2)}",
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
