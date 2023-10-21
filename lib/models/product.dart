import 'dart:convert';

import 'category.dart';

class Product {
  final int id;
  final String title;
  final int price;
  final String description;
  final Category category;
  final List<String> images;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.images,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'title': title});
    result.addAll({'price': price});
    result.addAll({'description': description});
    result.addAll({'category': category.toMap()});
    result.addAll({'images': images});
  
    return result;
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      price: map['price']?.toInt() ?? 0,
      description: map['description'] ?? '',
      category: Category.fromMap(map['category']),
      images: List<String>.from(map['images']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source));

  Product copyWith({
    int? id,
    String? title,
    int? price,
    String? description,
    Category? category,
    List<String>? images,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      category: category ?? this.category,
      images: images ?? this.images,
    );
  }
}
