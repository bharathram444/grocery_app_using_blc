import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_using_blc/cartManagement/cartManagement.dart';
import 'package:shopping_app_using_blc/features/home/models/product_data_modal_full_details.dart';
import 'package:shopping_app_using_blc/features/wishlist/bloc/wishlist_bloc.dart';

class WishlistTileWidget extends StatefulWidget {
  final ProductDataModelForFullDetails productDataforWishwidget;

  const WishlistTileWidget({
    Key? key, // Add Key? key parameter to the constructor
    required this.productDataforWishwidget,
  }) : super(key: key);

  @override
  State<WishlistTileWidget> createState() => _WishlistTileWidgetState();
}

class _WishlistTileWidgetState extends State<WishlistTileWidget> {
  @override
  Widget build(BuildContext context) {
    // Get the CartProvider instance using the Provider.of method
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    const TextStyle myTextStyle = TextStyle(
      fontSize: 16, // Font size
      fontWeight: FontWeight.bold, // Font weight
      //fontStyle: FontStyle.italic, // Font style
      letterSpacing: 1.2, // Letter spacing
      color: Colors.black87, // Text color
      fontFamily: 'Roboto',
    );
    ButtonStyle myButtonStyle = ButtonStyle(
      backgroundColor:
          MaterialStateProperty.all(const Color.fromARGB(52, 255, 255, 255)),
      foregroundColor:
          MaterialStateProperty.all(const Color.fromARGB(52, 255, 255, 255)),
      padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 18, horizontal: 26)),
      textStyle: MaterialStateProperty.all(
          const TextStyle(fontSize: 16, color: Colors.black)),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side: const BorderSide(
              width: 2,
              color: Colors.black,
            )),
      ),
    );

    return Container(
      width: double.maxFinite,
      height: 180,
      margin: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
      decoration: BoxDecoration(
        border: Border.all(width: 2),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(4),
      child: Row(mainAxisSize: MainAxisSize.max, children: [
        Container(
          color: Colors.white,
          width: 160,
          height: 200,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 122,
                child: Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              widget.productDataforWishwidget.imageUrl))),
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              const Divider(
                color: Colors.black54,
                height: 0,
                thickness: 2,
              ),
              Container(
                height: 36,
                width: 154,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(4),
                  color: const Color.fromARGB(52, 255, 255, 255),
                ),
                child: Row(
                  // mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 3, right: 3),
                      child: Text(
                        'Qty : ${widget.productDataforWishwidget.numproducts}',
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 1, right: 1),
          height: double.maxFinite,
          width: 2, // Set the width for the divider container
          color: Colors.black54,
          child: const Divider(
            color: Colors
                .transparent, // Set the color of the divider to transparent
            thickness: 2,
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.white,
            width: 180,
            height: 200,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 122,
                  // ignore: sized_box_for_whitespace
                  child: Container(
                    padding: const EdgeInsets.only(left: 6),
                    width: double.maxFinite,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.productDataforWishwidget
                              .name, // Use cartProductName here
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: myTextStyle.copyWith(fontSize: 22),
                        ),
                        Text(
                          "\$ ${widget.productDataforWishwidget.price}",
                          style: myTextStyle.copyWith(
                              color: const Color.fromARGB(255, 76, 200, 83),
                              fontSize: 26),
                        ),
                        Text(
                          "In Stock",
                          style: myTextStyle.copyWith(
                              color: const Color.fromARGB(255, 76, 200, 83),
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 36,
                  child: Container(
                    width: double.maxFinite,
                    color: Colors.transparent,
                    padding: const EdgeInsets.only(left: 3, right: 3),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          width: 110,
                          child: ElevatedButton(
                            onPressed: () {
                              // Remove the product to the cart using the cartProvider and dec
                              cartProvider.deleteFromWishList(
                                  context, widget.productDataforWishwidget);
                            },
                            style: myButtonStyle,
                            child: const Text('Delete !',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              cartProvider.MoveToWishlistremoveFromCart(
                                  context, widget.productDataforWishwidget);
                            },
                            style: myButtonStyle,
                            child: const Text('Move to Cart !',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
