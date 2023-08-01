import 'package:flutter/material.dart';
import 'package:shopping_app_using_blc/features/home/models/product_data_modal_full_details.dart';

class CartProvider extends ChangeNotifier {
  final List<ProductDataModelForFullDetails> _cartItems = [];

  List<ProductDataModelForFullDetails> get cartItems => _cartItems;

  final List<ProductDataModelForFullDetails> _wishItems = [];

  List<ProductDataModelForFullDetails> get wishItems => _wishItems;

  void addToCartAndInc(
      BuildContext context, ProductDataModelForFullDetails product) {
    bool existingProduct = false;
    for (var item in _cartItems) {
      if (item.id == product.id) {
        item.numproducts++;
        existingProduct = true;
        break;
      }
    }

    if (!existingProduct) {
      ProductDataModelForFullDetails newProduct =
          ProductDataModelForFullDetails(
        id: product.id,
        name: product.name,
        price: product.price,
        category: product.category,
        discription: product.discription,
        imageUrl: product.imageUrl,
        count: product.count,
        rating: product.rating,
        numproducts: 1,
      );
      _cartItems.add(newProduct);
    }

    _showSnackBar(context, 'Added to cart');
    notifyListeners();
  }

  void removeFromCartAndDec(
      BuildContext context, ProductDataModelForFullDetails product) {
    for (var item in _cartItems) {
      if (item.id == product.id) {
        item.numproducts--;
        if (item.numproducts == 0) {
          _cartItems.remove(item);
        }
        break;
      }
    }

    _showSnackBar(context, 'Removed from cart');
    notifyListeners();
  }

  void deleteFromCart(
      BuildContext context, ProductDataModelForFullDetails product) {
    _cartItems.remove(product);

    _showSnackBar(context, 'Deleted from Cart !');
    notifyListeners();
  }

  void moveToWishlistremoveFromCart(
      BuildContext context, ProductDataModelForFullDetails product) {
    bool existingProduct = false;
    for (var item in _wishItems) {
      if (item.id == product.id) {
        item.numproducts = item.numproducts + product.numproducts;
        existingProduct = true;
        break;
      }
    }

    if (!existingProduct) {
      ProductDataModelForFullDetails newProduct =
          ProductDataModelForFullDetails(
        id: product.id,
        name: product.name,
        price: product.price,
        category: product.category,
        discription: product.discription,
        imageUrl: product.imageUrl,
        count: product.count,
        rating: product.rating,
        numproducts: product.numproducts,
      );
      _wishItems.add(newProduct);
    }
    _cartItems.remove(product);
    _showSnackBar(context, 'Item moved to Wishlist !');
    notifyListeners();
  }

// for calculating total price
  double calculateTotalPrice() {
    double totalPrice = 0.0;
    for (var item in _cartItems) {
      totalPrice += (item.price * item.numproducts);
    }
    return totalPrice;
  }

// for WishList
  void addToWishListAndInc(
      BuildContext context, ProductDataModelForFullDetails product) {
    bool existingProduct = false;
    for (var item in _wishItems) {
      if (item.id == product.id) {
        item.numproducts++;
        existingProduct = true;
        break;
      }
    }

    if (!existingProduct) {
      ProductDataModelForFullDetails newProduct =
          ProductDataModelForFullDetails(
        id: product.id,
        name: product.name,
        price: product.price,
        category: product.category,
        discription: product.discription,
        imageUrl: product.imageUrl,
        count: product.count,
        rating: product.rating,
        numproducts: 1,
      );
      _wishItems.add(newProduct);
    }

    _showSnackBar(context, 'Added to WishList');
    notifyListeners();
  }

  void deleteFromWishList(
      BuildContext context, ProductDataModelForFullDetails product) {
    _wishItems.remove(product);

    _showSnackBar(context, 'Deleted from WishList !');
    notifyListeners();
  }

  void moveToCartremoveFromWishlist(
      BuildContext context, ProductDataModelForFullDetails product) {
    bool existingProduct = false;
    for (var item in _cartItems) {
      if (item.id == product.id) {
        item.numproducts = item.numproducts + product.numproducts;
        existingProduct = true;
        break;
      }
    }

    if (!existingProduct) {
      ProductDataModelForFullDetails newProduct =
          ProductDataModelForFullDetails(
        id: product.id,
        name: product.name,
        price: product.price,
        category: product.category,
        discription: product.discription,
        imageUrl: product.imageUrl,
        count: product.count,
        rating: product.rating,
        numproducts: product.numproducts,
      );
      _cartItems.add(newProduct);
    }
    _wishItems.remove(product);
    _showSnackBar(context, 'Item moved to Cart !');
    notifyListeners();
  }

// For SnakBar
  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  // Add other methods to manage the cart as needed.
}
