import 'package:flutter/material.dart';

import '../models/Product.dart';
import '../models/category.dart';

class CategoryProvider extends ChangeNotifier {
  final List<String> _categoryList = ["All Product"];
  String _selectedCategory = "All Product";

  final List<Product> _selectedCategoryProductsList = [];
  void addCategory(Category newCategory) {
    if (!_categoryList.contains(newCategory.name)) {
      _categoryList.add(newCategory.name);
    }
    notifyListeners();
  }

  void updateSelectedCategory(
      String newCategoryName, List<Product> productList) {
    _selectedCategory = newCategoryName;
    _selectedCategoryProductsList.clear();
    for (Product product in productList) {
      if (product.category.name == newCategoryName) {
        _selectedCategoryProductsList.add(product);
      }
    }
    notifyListeners();
  }

  get categoryList => _categoryList;
  get selectedCategory => _selectedCategory;
  get selectedCategoryProductsList => _selectedCategoryProductsList;
}
