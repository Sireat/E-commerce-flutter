import 'package:flutter/material.dart';
import '../../domain/entities/product_entity.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _cartItems = [];

  List<Product> get cartItems => _cartItems;

  void addToCart(Product product) {
    _cartItems.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cartItems.remove(product);
    notifyListeners();
  }

  double get totalPrice {
    return _cartItems.fold(0, (sum, item) => sum + item.price);
  }
}
