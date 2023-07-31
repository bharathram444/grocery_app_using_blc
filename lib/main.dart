import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_using_blc/cartManagement/cartManagement.dart';
import 'package:shopping_app_using_blc/features/cart/ui/cart.dart';
import 'package:shopping_app_using_blc/features/home/ui/home.dart';
import 'package:shopping_app_using_blc/features/wishlist/ui/wishlist.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<CartProvider>(create: (_) => CartProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        //'/product/:product': (context) =>  ProductInfoDisplayPage(productInfoDisplayProduct: ),
        '/cart': (context) => const Cart(),
        '/wishlist': (context) => const WishList(),
      },
    );
  }
}
