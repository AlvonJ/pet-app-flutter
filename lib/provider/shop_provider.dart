import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartNotifierProvider = ChangeNotifierProvider<CartNotifier>(
  (ref) => CartNotifier(),
);

class CartNotifier extends ChangeNotifier {
  List<Product> cart = [];

  List<Product> get getProducts => cart;

  void addProduct(Product product) {
    cart.add(product);
    notifyListeners();
  }

  void removeProduct(Product product) {
    cart.remove(product);
    notifyListeners();
  }

  void clearCart() {
    cart.clear();
    notifyListeners();
  }
}

class Product {
  String title;
  int price;
  String path;

  Product({
    required this.title,
    required this.price,
    required this.path,
  });
}
