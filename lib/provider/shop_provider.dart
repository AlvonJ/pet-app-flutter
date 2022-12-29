import 'package:equatable/equatable.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final shopDetailProvider = StateProvider((ref) => {});

final cartNotifierProvider = ChangeNotifierProvider<CartNotifier>(
  (ref) => CartNotifier(),
);

final cartProvider = StateProvider(
  (ref) {
    List<Item> counts = [];
    final carts = ref.watch(cartNotifierProvider).cart;
    for (var element in carts) {
      for (var items in counts) {
        if (items.product.title == element.title) {
          items.amount += 1;
          print(counts.toString());
        } else {
          counts.add(Item(product: element, amount: 1));
        }
      }
    }
    return counts;
  },
);

class CartNotifier extends ChangeNotifier {
  List<Product> cart = [];
  List<int> total = [];

  List<Product> get getProducts => cart;

  void addProduct(Product product) {
    if (cart.contains(product)) {
      var index = cart.indexOf(product);
      total[index] += 1;
    } else {
      cart.add(product);
      total.add(1);
    }
    print(product == cart[0]);
    notifyListeners();
  }

  // hapus semua product
  void clearProduct(int index) {
    cart.removeAt(index);
    total.removeAt(index);

    notifyListeners();
  }

  // - 1 product
  void removeProduct(int index) {
    total[index] -= 1;
    notifyListeners();
  }

  // + 1 product
  void plusProduct(int index) {
    total[index] += 1;
    notifyListeners();
  }

  void clearCart() {
    cart.clear();
    total.clear();
    notifyListeners();
  }
}

class Product extends Equatable {
  final String title;
  final int price;
  final String path;

  const Product({required this.title, required this.price, required this.path});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          price == other.price &&
          path == other.path;

  @override
  int get hashCode => title.hashCode ^ price.hashCode ^ path.hashCode;

  @override
  List<Object> get props => [];
}

class Item {
  Product product;
  int amount;

  Item({required this.product, this.amount = 1});
}
