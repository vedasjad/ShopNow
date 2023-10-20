import 'dart:convert';

import 'package:ecommerceapptask/models/category.dart';

/// id : 4
/// title : "Handmade Fresh Table"
/// price : 687
/// description : "Andy shoes are designed to keeping in..."
/// category : {"id":5,"name":"Others","image":"https://placeimg.com/640/480/any?r=0.591926261873231"}
/// images : ["https://placeimg.com/640/480/any?r=0.9178516507833767","https://placeimg.com/640/480/any?r=0.9300320592588625","https://placeimg.com/640/480/any?r=0.8807778235430017"]

Product productFromJson(String str) => Product.fromJson(json.decode(str));
String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    required num? id,
    required String? title,
    required num? price,
    required String? description,
    required Category? category,
    required List<String>? images,
  }) {
    _id = id;
    _title = title;
    _price = price;
    _description = description;
    _category = category;
    _images = images;
  }

  Product.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _price = json['price'];
    _description = json['description'];
    _category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    _images = json['images'] != null ? json['images'].cast<String>() : [];
  }
  num? _id;
  String? _title;
  num? _price;
  String? _description;
  Category? _category;
  List<String>? _images;
  Product copyWith({
    num? id,
    String? title,
    num? price,
    String? description,
    Category? category,
    List<String>? images,
  }) =>
      Product(
        id: id ?? _id,
        title: title ?? _title,
        price: price ?? _price,
        description: description ?? _description,
        category: category ?? _category,
        images: images ?? _images,
      );
  num? get id => _id;
  String? get title => _title;
  num? get price => _price;
  String? get description => _description;
  Category? get category => _category;
  List<String>? get images => _images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['price'] = _price;
    map['description'] = _description;
    if (_category != null) {
      map['category'] = _category?.toJson();
    }
    map['images'] = _images;
    return map;
  }
}
