import 'package:flutter/material.dart';
import 'package:shopping_app_using_blc/features/cart/bloc/cart_bloc.dart';
import 'package:shopping_app_using_blc/features/home/models/home_product_data_modal.dart';

class CartTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final CartBloc cartBloc;
  const CartTileWidget({
    super.key,
    required this.productDataModel,
    required this.cartBloc,
  });

  @override
  Widget build(BuildContext context) {
    const TextStyle myTextStyle = TextStyle(
      fontSize: 16, // Font size
      fontWeight: FontWeight.bold, // Font weight
      //fontStyle: FontStyle.italic, // Font style
      letterSpacing: 1.2, // Letter spacing
      color: Colors.black87, // Text color
      fontFamily: 'Roboto',
    );
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 8, right: 12, left: 12),
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: Card(
        margin: EdgeInsets.zero,
        semanticContainer: false,
        elevation: 2.0,
        borderOnForeground: false,
        child: Container(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          child: Row(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                        image: NetworkImage(productDataModel.imageUrl)),
                    border: Border.all(width: 0, color: Colors.transparent),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(4),
                        topLeft: Radius.circular(4))),
              ),
              const SizedBox(
                width: 6,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 228, 180, 236),
                      border: Border.all(width: 0, color: Colors.transparent),
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(4),
                          topRight: Radius.circular(4))),
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            productDataModel.name,
                            style: myTextStyle,
                          ),
                          Text(
                            "\$ ${productDataModel.price}",
                            style: myTextStyle.copyWith(
                                color:
                                    const Color.fromARGB(255, 167, 250, 171)),
                          ),
                        ],
                      ),
                      // const SizedBox(
                      //   height: 8,
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    cartBloc.add(CartItemRemoveEvent(
                                        productDataModel: productDataModel));
                                  },
                                  icon: const Icon(Icons.close))
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
