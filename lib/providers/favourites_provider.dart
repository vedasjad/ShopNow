import 'package:flutter/material.dart';

import '../models/Product.dart';

class FavouritesProvider extends ChangeNotifier {
  final List<Product> _favouritesList = [];

  void addFavourite(Product product) {
    _favouritesList.add(product);
    notifyListeners();
  }

  void removeFavourite(Product product) {
    _favouritesList.remove(product);
    notifyListeners();
  }

  get favouritesList => _favouritesList;
}
