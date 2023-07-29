import 'package:flutter/material.dart';
import 'package:shopping_app_using_blc/features/home/models/product_data_modal_full_details.dart';

class CartProvider extends ChangeNotifier {
  final List<ProductDataModelForFullDetails> _cartItems = [];

  List<ProductDataModelForFullDetails> get cartItems => _cartItems;

  void addToCart(ProductDataModelForFullDetails product) {
    _cartItems.add(product);
    notifyListeners();
  }

  // Add other methods to manage the cart as needed, like removing items, calculating total price, etc.
}
