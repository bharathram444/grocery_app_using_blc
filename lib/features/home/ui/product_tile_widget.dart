import 'package:flutter/material.dart';
import 'package:shopping_app_using_blc/features/home/bloc/home_bloc.dart';
import 'package:shopping_app_using_blc/features/home/models/home_product_data_modal.dart';

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
  late String firstHalf;
  late String secondHalf;

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.productDataModel.discription.length > 30) {
      firstHalf = widget.productDataModel.discription.substring(0, 30);
      secondHalf = widget.productDataModel.discription.substring(
        30,
        widget.productDataModel.discription.length,
      );
    } else {
      firstHalf = widget.productDataModel.discription;
      secondHalf = "";
    }
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
      margin: const EdgeInsets.only(bottom: 10, top: 10, left: 10, right: 10),
      padding: const EdgeInsets.all(10),
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
                                    //posts[index].title
                                    image: NetworkImage(
                                        widget.productDataModel.imageUrl))),
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
                          border:
                              Border.all(width: 0, color: Colors.transparent),
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(3),
                              bottomRight: Radius.circular(3))),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 7),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  flag ? ("$firstHalf ...") : (firstHalf),
                                  overflow: TextOverflow.ellipsis,
                                  style: myTextStyle.copyWith(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          MoreLessWidget(
                            productDataModel: widget.productDataModel,
                            myTextStyle: myTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$ ${widget.productDataModel.price}",
                                style: myTextStyle.copyWith(
                                    color: const Color.fromARGB(
                                        255, 167, 250, 171),
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
                                  IconButton(
                                      onPressed: () {
                                        widget.homeBloc.add(
                                            HomeProductCartButtonClickedEvent(
                                                clickedProduct:
                                                    widget.productDataModel));
                                      },
                                      icon: const Icon(
                                          Icons.add_shopping_cart_rounded))
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

class MoreLessWidget extends StatefulWidget {
  const MoreLessWidget({
    super.key,
    required this.productDataModel,
    required this.myTextStyle,
  });

  final ProductDataModel productDataModel;
  final TextStyle myTextStyle;

  @override
  State<MoreLessWidget> createState() => _MoreLessWidgetState();
}

class _MoreLessWidgetState extends State<MoreLessWidget> {
  late String firstHalf;
  late String secondHalf;

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.productDataModel.discription.length > 50) {
      firstHalf = widget.productDataModel.discription.substring(0, 50);
      secondHalf = widget.productDataModel.discription.substring(
        50,
        widget.productDataModel.discription.length,
      );
    } else {
      firstHalf = widget.productDataModel.discription;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: secondHalf.isEmpty
                ? Text(
                    firstHalf,
                    overflow: TextOverflow.ellipsis,
                  )
                : SingleChildScrollView(
                    // Wrap with SingleChildScrollView
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        Text(
                          flag ? ("$firstHalf ...") : (firstHalf + secondHalf),
                          overflow: TextOverflow.ellipsis,
                        ),
                        InkWell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                flag ? "show more" : "show less",
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 33, 243, 75),
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            setState(() {
                              flag = !flag;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
