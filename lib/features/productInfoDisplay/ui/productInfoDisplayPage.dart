import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_using_blc/features/cart/bloc/cart_bloc.dart';
import 'package:shopping_app_using_blc/features/cart/ui/cart.dart';
import 'package:shopping_app_using_blc/features/home/models/product_data_modal_full_details.dart';
import 'package:shopping_app_using_blc/features/productInfoDisplay/bloc/product_info_display_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shopping_app_using_blc/features/productInfoDisplay/cartManagement/cartManagement.dart';

class ProductInfoDisplayPage extends StatefulWidget {
  final ProductDataModelForFullDetails productInfoDisplayProduct;

  const ProductInfoDisplayPage(
      {super.key, required this.productInfoDisplayProduct});

  @override
  State<ProductInfoDisplayPage> createState() => _ProductInfoDisplayPageState();
}

class _ProductInfoDisplayPageState extends State<ProductInfoDisplayPage> {
  @override
  void initState() {
    productInfoDisplayBloc.add(ProductInfoDisplayInitialEvent());
    super.initState();
  }

  final ProductInfoDisplayBloc productInfoDisplayBloc =
      ProductInfoDisplayBloc();
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
      height: 1.5,
    );
    ButtonStyle myButtonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.blue),
      foregroundColor: MaterialStateProperty.all(Colors.white),
      padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 14, horizontal: 22)),
      textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 16)),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      side: MaterialStateProperty.resolveWith<BorderSide>(
        (states) {
          return const BorderSide(
            color: Colors.black, // Set the border color
            width: 2.0, // Set the border width
          );
        },
      ),
    );
    return BlocConsumer<ProductInfoDisplayBloc, ProductInfoDisplayState>(
      bloc: productInfoDisplayBloc,
      listenWhen: (previous, current) =>
          current is ProductInfoDisplayActionState,
      buildWhen: (previous, current) =>
          current is! ProductInfoDisplayActionState,
      listener: (context, state) {
        if (state is ProductInfoDisplayToCartPageActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Cart()),
          );
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case ProductInfoDisplayLoadedSuccessState:
            final successState = state as ProductInfoDisplayLoadedSuccessState;

            return Scaffold(
              appBar: AppBar(
                backgroundColor: const Color.fromARGB(0, 0, 0, 0),
                title:
                    // ignore: unnecessary_string_interpolations
                    Text("${widget.productInfoDisplayProduct.category}"),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {
                      productInfoDisplayBloc
                          .add(ProductInfoDisplayToCartNavigateEvent());
                    },
                  ),
                ],
              ),
              body: Container(
                padding: const EdgeInsets.all(6),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 6, bottom: 6),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                          ),
                          color: Colors.transparent,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Container(
                          height: 360,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(widget
                                      .productInfoDisplayProduct.imageUrl))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 0, bottom: 6),
                        child: Text(
                          widget.productInfoDisplayProduct
                              .name, // Use cartProductName here
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: myTextStyle.copyWith(fontSize: 22),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 0, bottom: 6),
                        child: Text(
                          textAlign: TextAlign.left,
                          "\$ ${widget.productInfoDisplayProduct.price}",
                          style: myTextStyle.copyWith(
                              color: const Color.fromARGB(255, 76, 200, 83),
                              fontSize: 26),
                        ),
                      ),
                      Container(
                        //height: double.maxFinite,
                        padding: const EdgeInsets.only(top: 0, bottom: 6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Discription : ",
                              style: myTextStyle.copyWith(
                                fontSize: 18,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              widget.productInfoDisplayProduct
                                  .discription, // Use cartProductName here
                              overflow: TextOverflow.ellipsis,
                              maxLines: 8,
                              style: myTextStyle.copyWith(
                                  fontSize: 18,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w600,
                                  height: 1.7),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              bottomSheet: Container(
                transformAlignment: AlignmentDirectional.bottomEnd,
                //alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.all(4),
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(4),
                    color: const Color.fromARGB(42, 96, 125, 139)),
                height: 64,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.transparent,
                        height: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Rating ↓ ",
                              style: myTextStyle.copyWith(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                const SizedBox(width: 6),
                                RatingBar.builder(
                                  initialRating:
                                      widget.productInfoDisplayProduct.rating,
                                  minRating: 0,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 26.0,
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    // You can implement any logic here when the rating is updated.
                                  },
                                ),
                                Text(
                                  "${widget.productInfoDisplayProduct.rating} out of 5 ",
                                  style: myTextStyle,
                                )
                              ],
                            )
                          ],
                        ),
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
                    Container(
                      color: Colors.transparent,
                      width: 150, // Set the width of Container 1 to 150 pixels
                      height: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Reviews ↓ ",
                            style: myTextStyle.copyWith(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const SizedBox(width: 74),
                              Text(
                                "${widget.productInfoDisplayProduct.count}",
                                style: myTextStyle,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: BottomAppBar(
                height: 60,
                color: const Color.fromARGB(142, 255, 255, 255),
                padding: const EdgeInsets.only(
                    top: 8, bottom: 8, left: 30, right: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 36,
                      child: Container(
                        width: 140,
                        color: Colors.transparent,
                        child: Container(
                          width: double.maxFinite,
                          color: Colors.transparent,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(4),
                              color: const Color.fromARGB(52, 255, 255, 255),
                            ),
                            child: Row(
                              // mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    // widget.cartBloc.add(CartItemDecrementEvent(
                                    //     decrementproduct: widget.productDataModel));
                                  },
                                  icon: const Icon(
                                    Icons.remove,
                                    color: Colors.black,
                                    size: 18,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 1, right: 1, top: 3, bottom: 3),
                                  height: double.maxFinite,
                                  width:
                                      2, // Set the width for the divider container
                                  color: Colors.black54,
                                  child: const Divider(
                                    color: Colors
                                        .transparent, // Set the color of the divider to transparent
                                    thickness: 2,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 3, right: 3),
                                  child: Text(
                                    '${widget.productInfoDisplayProduct.numproducts}',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 1, right: 1, top: 3, bottom: 3),
                                  height: double.maxFinite,
                                  width:
                                      2, // Set the width for the divider container
                                  color: Colors.black54,
                                  child: const Divider(
                                    color: Colors
                                        .transparent, // Set the color of the divider to transparent
                                    thickness: 2,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    // widget.cartBloc.add(CartItemIncrementEvent(
                                    //     incrementproduct: widget.productDataModel));
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                    color: Colors.black,
                                    size: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Add the product to the cart using the cartProvider
                        cartProvider
                            .addToCart(widget.productInfoDisplayProduct);
                      },
                      style: myButtonStyle.copyWith(),
                      child: Text('Add to Cart !',
                          style: myTextStyle.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 18)),
                    ),
                  ],
                ),
              ),
            );
          default:
            return Scaffold(
              appBar: AppBar(
                title: const Text("ProductInfoDisplay Page"),
              ),
              body: Center(
                child: Container(
                  color: Colors.blueGrey,
                  // child: Text(
                  //     "data price : ${successStateofProductInfoDisplayPage.infoDisplayProduct.price}"),
                ),
              ),
            );
        }
      },
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:shopping_app_using_blc/features/home/bloc/home_bloc.dart';

// class productInfoDisplayPage extends StatefulWidget {
//   @override
//   _productInfoDisplayPageState createState() => _productInfoDisplayPageState();
// }

// class _productInfoDisplayPageState extends State<productInfoDisplayPage> {
//   final HomeBloc homeBloc = HomeBloc();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Second Page'),
//       ),
//       body: Center(
//         child: Text('Welcome to the Second Page! '),
//       ),
//     );
//   }
// }
