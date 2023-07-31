import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_using_blc/cartManagement/cartManagement.dart';
import 'package:shopping_app_using_blc/features/home/models/product_data_modal_full_details.dart';
import 'package:shopping_app_using_blc/features/wishlist/ui/wishlist_title_widget.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
//  final WishlistBloc wishlistBloc = WishlistBloc();
  @override
  void initState() {
    // wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final List<ProductDataModelForFullDetails> cartList =
        cartProvider.cartItems;
    final List<ProductDataModelForFullDetails> wishList =
        cartProvider.wishItems;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[200],
          title: const Text('WishList Items'),
        ),
        body: Container(
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
                      itemCount: wishList.length,
                      itemBuilder: (context, index) {
                        return WishlistTileWidget(
                          productDataforWishwidget: wishList[index],
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "\$ ${cartProvider.calculateTotalPrice()}",
                      // "\$${totalPrice.toStringAsFixed(2)}",
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "CartItems ${cartList.length}",
                      // "\$${totalPrice.toStringAsFixed(2)}",
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "WishListItems ${wishList.length}",
                      // "\$${totalPrice.toStringAsFixed(2)}",
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
