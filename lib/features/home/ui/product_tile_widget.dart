import 'package:flutter/material.dart';
import 'package:shopping_app_using_blc/features/home/bloc/home_bloc.dart';
import 'package:shopping_app_using_blc/features/home/models/home_product_data_modal.dart';
import 'package:shopping_app_using_blc/features/home/models/product_data_modal_full_details.dart';

class ProductTileWidget extends StatefulWidget {
  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;
  const ProductTileWidget({
    super.key,
    required this.productDataModel,
    required this.homeBloc,
  });

  @override
  State<ProductTileWidget> createState() => _ProductTileWidgetState();
}

class _ProductTileWidgetState extends State<ProductTileWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle myTextStyle = TextStyle(
      fontSize: 10, // Font size
      fontWeight: FontWeight.bold, // Font weight
      //fontStyle: FontStyle.italic, // Font style
      letterSpacing: 1.5, // Letter spacing
      color: Colors.black87, // Text color
      fontFamily: 'Roboto',
    );
    return Container(
      width: 300,
      margin: const EdgeInsets.only(bottom: 6, top: 6, left: 6, right: 6),
      padding: const EdgeInsets.all(6),
      color: Colors.transparent,
      child: GestureDetector(
        onTap: () {
          widget.homeBloc.add(ProductInfoDisplayNavigateEvent(
              infoDisplayProduct: widget.productDataModel));
        },
        child: Column(
          children: [
            Card(
              semanticContainer: true,
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
                      child: Column(
                        children: [
                          Container(
                            height: 280,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    //fit: BoxFit.cover,
                                    //posts[index].title
                                    image: NetworkImage(
                                        widget.productDataModel.imageUrl))),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 6),
                            child: Divider(
                              color: Colors.black54,
                              height: 0,
                              thickness: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(13, 0, 150, 135),
                          border:
                              Border.all(width: 0, color: Colors.transparent),
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(3),
                              bottomRight: Radius.circular(3))),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 7),
                            child: Text(
                              widget.productDataModel
                                  .name, // Use cartProductName here
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: myTextStyle.copyWith(fontSize: 16),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$ ${widget.productDataModel.price}",
                                style: myTextStyle.copyWith(
                                    color:
                                        const Color.fromARGB(255, 9, 132, 15),
                                    fontSize: 20),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        widget.homeBloc.add(
                                            HomeProductWishlistButtonClickedEvent(
                                                clickedProduct:
                                                    widget.productDataModel));
                                      },
                                      icon: const Icon(
                                          Icons.favorite_outline_rounded)),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
