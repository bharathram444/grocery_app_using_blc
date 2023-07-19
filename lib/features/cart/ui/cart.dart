import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app_using_blc/features/cart/bloc/cart_bloc.dart';
import 'package:shopping_app_using_blc/features/cart/ui/cart_title_widget.dart';

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
              content: Text('Item Removed from Cart !'),
              duration: Duration(seconds: 1),
            ));
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessState:
              final successState = state as CartSuccessState;
              return Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://images.squarespace-cdn.com/content/v1/5aa5a05cfcf7fd70d5c3b558/1521246372456-TKBYGGL86AFJZZZU8O6H/Artboard+2+copy+2%402x.png?format=2500w'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: ListView.builder(
                    itemCount: successState.CartItems.length,
                    itemBuilder: (context, index) {
                      return CartTileWidget(
                        productDataModel: successState.CartItems[index],
                        cartBloc: cartBloc,
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
