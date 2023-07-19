import 'package:flutter/material.dart';
import 'package:shopping_app_using_blc/features/home/bloc/home_bloc.dart';
import 'package:shopping_app_using_blc/features/home/models/home_product_data_modal.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;
  const ProductTileWidget({
    super.key,
    required this.productDataModel,
    required this.homeBloc,
  });

  @override
  Widget build(BuildContext context) {
    const TextStyle myTextStyle = TextStyle(
      fontSize: 20, // Font size
      fontWeight: FontWeight.bold, // Font weight
      //fontStyle: FontStyle.italic, // Font style
      letterSpacing: 1.5, // Letter spacing
      color: Colors.black87, // Text color
      fontFamily: 'Roboto',
    );
    return Container(
      margin: const EdgeInsets.only(bottom: 10, top: 10, left: 20, right: 20),
      padding: const EdgeInsets.all(10),
      color: Colors.transparent,
      child: Card(
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(width: 2),
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                    top: 10, right: 10, left: 10, bottom: 2),
                // decoration: BoxDecoration(
                //     border: Border.all(width: 0),
                //     borderRadius: const BorderRadius.all(Radius.circular(5))),
                child: Column(
                  children: [
                    Container(
                      height: 280,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              //fit: BoxFit.cover,
                              image: NetworkImage(productDataModel.imageUrl))),
                    ),
                    const Divider(
                      color: Colors.black54,
                      height: 0,
                      thickness: 2,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: Colors.purple[200],
                    border: Border.all(width: 0, color: Colors.transparent),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(3),
                        bottomRight: Radius.circular(3))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 7),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          productDataModel.discription,
                          style: myTextStyle.copyWith(
                            color: Colors.black87,
                            fontSize: 14,
                            letterSpacing: 0.5,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {
                                  homeBloc.add(
                                      HomeProductWishlistButtonClickedEvent(
                                          clickedProduct: productDataModel));
                                },
                                icon:
                                    const Icon(Icons.favorite_outline_rounded)),
                            IconButton(
                                onPressed: () {
                                  homeBloc.add(
                                      HomeProductCartButtonClickedEvent(
                                          clickedProduct: productDataModel));
                                },
                                icon:
                                    const Icon(Icons.add_shopping_cart_rounded))
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
