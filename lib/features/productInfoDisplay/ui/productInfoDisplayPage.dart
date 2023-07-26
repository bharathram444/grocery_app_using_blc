import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app_using_blc/features/productInfoDisplay/bloc/product_info_display_bloc.dart';

// ignore: camel_case_types
class productInfoDisplayPage extends StatefulWidget {
  const productInfoDisplayPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _productInfoDisplayPageState createState() => _productInfoDisplayPageState();
}

// ignore: camel_case_types
class _productInfoDisplayPageState extends State<productInfoDisplayPage> {
  @override
  void initState() {
    productInfoDisplayBloc.add(ProductInfoDisplayInitialEvent());
    super.initState();
  }

  final ProductInfoDisplayBloc productInfoDisplayBloc =
      ProductInfoDisplayBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductInfoDisplayBloc, ProductInfoDisplayState>(
      bloc: productInfoDisplayBloc,
      listenWhen: (previous, current) =>
          current is ProductInfoDisplayActionState,
      buildWhen: (previous, current) =>
          current is! ProductInfoDisplayActionState,
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.runtimeType) {
          case ProductInfoDisplayLoadedSuccessState:
            final successState = state as ProductInfoDisplayLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                title: const Text(""),
              ),
              body: Center(
                child: Container(
                  color: const Color.fromARGB(255, 157, 129, 129),
                  child: Text(
                      "data price : ${successState.productInfoDisplayProduct.price}"),
                ),
              ),
            );
          default:
            return Scaffold(
              appBar: AppBar(
                title: const Text("ProductInfoDisplay nPage"),
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
