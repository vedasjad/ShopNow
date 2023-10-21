import 'package:flutter/material.dart';

import '../models/Product.dart';

class ProductProvider extends ChangeNotifier {
  final List<Product> _productList = [];
  int _activeIndex = 0;

  void updateActiveIndex(int newIndex) {
    _activeIndex = newIndex;
    notifyListeners();
  }

  void addProduct(Product newProduct) {
    _productList.add(newProduct);
    notifyListeners();
  }

  get activeIndex => _activeIndex;

  get productList => _productList;
}
