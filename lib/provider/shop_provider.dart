import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartNotifierProvider = ChangeNotifierProvider<CartNotifier>(
  (ref) => CartNotifier(),
);

class CartNotifier extends ChangeNotifier {
  List<Map> cart = [];

  List<Map> get getProducts => cart;

  void addProduct(Map product) {
    cart.add(product);
    notifyListeners();
  }

  void removeProduct(Map product) {
    cart.remove(product);
    notifyListeners();
  }

  void clearCart() {
    cart.clear();
    notifyListeners();
  }
}
