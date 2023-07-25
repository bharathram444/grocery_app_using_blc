import 'package:flutter/material.dart';
import 'package:shopping_app_using_blc/features/cart/bloc/cart_bloc.dart';
import 'package:shopping_app_using_blc/features/home/models/home_product_data_modal.dart';

class CartTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final CartBloc cartBloc;
  const CartTileWidget({
    Key? key, // Add Key? key parameter to the constructor
    required this.productDataModel,
    required this.cartBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    num count = 1 ?? 2;
    const TextStyle myTextStyle = TextStyle(
      fontSize: 16, // Font size
      fontWeight: FontWeight.bold, // Font weight
      //fontStyle: FontStyle.italic, // Font style
      letterSpacing: 1.2, // Letter spacing
      color: Colors.black87, // Text color
      fontFamily: 'Roboto',
    );
    ButtonStyle myButtonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.blue),
      foregroundColor: MaterialStateProperty.all(Colors.white),
      padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 14, horizontal: 22)),
      textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 16)),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );

    return Container(
      width: double.maxFinite,
      height: 200,
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
          width: 180,
          height: 200,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 136,
                child: Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(productDataModel.imageUrl))),
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
              SizedBox(
                height: 46,
                child: Container(
                  width: double.maxFinite,
                  color: Colors.transparent,
                  child: Container(
                    width: double.maxFinite,
                    color: Colors.transparent,
                    padding: const EdgeInsets.only(
                        left: 3, right: 3, top: 2, bottom: 2),
                    margin: const EdgeInsets.only(
                      top: 6,
                      bottom: 6,
                    ),
                    child: Container(
                      // height: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.blue,
                      ),
                      child: Row(
                        // mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                left: 1, right: 1, top: 3, bottom: 3),
                            height: double.maxFinite,
                            width: 2, // Set the width for the divider container
                            color: Colors.black54,
                            child: const Divider(
                              color: Colors
                                  .transparent, // Set the color of the divider to transparent
                              thickness: 2,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 3, right: 3),
                            child: Text(
                              '$count',
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                left: 1, right: 1, top: 3, bottom: 3),
                            height: double.maxFinite,
                            width: 2, // Set the width for the divider container
                            color: Colors.black54,
                            child: const Divider(
                              color: Colors
                                  .transparent, // Set the color of the divider to transparent
                              thickness: 2,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              cartBloc.add(CartItemIncrementEvent(
                                  incrementproduct: productDataModel));
                            },
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
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
                  height: 136,
                  // ignore: sized_box_for_whitespace
                  child: Container(
                    padding: const EdgeInsets.only(left: 6),
                    width: double.maxFinite,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          productDataModel.name, // Use cartProductName here
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: myTextStyle.copyWith(fontSize: 22),
                        ),
                        Text(
                          "\$ ${productDataModel.price}",
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
                  height: 46,
                  child: Container(
                    width: double.maxFinite,
                    color: Colors.transparent,
                    padding: const EdgeInsets.only(left: 3, right: 3),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          width: 100,
                          child: TextButton(
                            onPressed: () {
                              cartBloc.add(CartItemRemoveEvent(
                                  productDataModel: productDataModel));
                            },
                            style: myButtonStyle,
                            child: const Text('Delete !'),
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              cartBloc.add(CartItemRemoveAndAddToWishlistEvent(
                                  productDataModel: productDataModel));
                            },
                            style: myButtonStyle,
                            child: const Text('Move to Wishlist !'),
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
