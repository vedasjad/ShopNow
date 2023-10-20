import 'dart:convert';

/// id : 5
/// name : "Others"
/// image : "https://placeimg.com/640/480/any?r=0.591926261873231"

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));
String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  Category({
    required num? id,
    required String? name,
    required String? image,
  }) {
    _id = id;
    _name = name;
    _image = image;
  }

  Category.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
  }
  num? _id;
  String? _name;
  String? _image;
  Category copyWith({
    num? id,
    String? name,
    String? image,
  }) =>
      Category(
        id: id ?? _id,
        name: name ?? _name,
        image: image ?? _image,
      );
  num? get id => _id;
  String? get name => _name;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image'] = _image;
    return map;
  }
}
