import 'package:flutter/material.dart';
import 'package:shopping_app_using_blc/features/home/models/home_product_data_modal.dart';
import 'package:shopping_app_using_blc/features/wishlist/bloc/wishlist_bloc.dart';

class WishlistTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final WishlistBloc wishlistBloc;
  const WishlistTileWidget({
    super.key,
    required this.productDataModel,
    required this.wishlistBloc,
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
      margin: const EdgeInsets.only(bottom: 2, top: 2, left: 10, right: 10),
      padding: const EdgeInsets.all(4),
      color: Colors.transparent,
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(width: 2),
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          padding: const EdgeInsets.all(10),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        //fit: BoxFit.cover,
                        image: NetworkImage(productDataModel.imageUrl))),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          productDataModel.name,
                          style: myTextStyle,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          "\$ ${productDataModel.price}",
                          style: myTextStyle.copyWith(
                              color: const Color.fromARGB(255, 167, 250, 171)),
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
                                  wishlistBloc.add(WishlistItemRemoveEvent(
                                      productDataModel: productDataModel));
                                },
                                icon: const Icon(Icons.close))
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
