// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ecommerce_php/core/functions/list_parse.dart';

class Product {
  int? id;
  String? name;
  double? rating;
  List<String>? tags;
  double? price;
  List<String>? sizes;
  List<String>? colors;
  String? description;
  String? image;
  Product({this.id, this.name, this.rating, this.tags, this.price, this.sizes, this.colors, this.description, this.image});

  Product copyWith({
    int? id,
    String? name,
    double? rating,
    List<String>? tags,
    double? price,
    List<String>? sizes,
    List<String>? colors,
    String? description,
    String? image,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      rating: rating ?? this.rating,
      tags: tags ?? this.tags,
      price: price ?? this.price,
      sizes: sizes ?? this.sizes,
      colors: colors ?? this.colors,
      description: description ?? this.description,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id.toString(),
      'name': name.toString(),
      'rating': rating.toString(),
      'tags': tags.toString(),
      'price': price.toString(),
      'sizes': sizes.toString(),
      'colors': colors.toString(),
      'description': description.toString(),
      'image': image.toString(),
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: int.tryParse(map['id'].toString()),
      name: map['name'] as String,
      rating: double.tryParse(map['rating'].toString()),
      tags: listParse(map['tags'].toString()),
      price: double.tryParse(map['price'].toString()),
      sizes: listParse(map['sizes'].toString()),
      colors: listParse(map['colors'].toString()),
      description: map['description'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(id: $id, name: $name, rating: $rating, tags: $tags, price: $price, sizes: $sizes, colors: $colors, description: $description, image: $image)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.rating == rating &&
        other.tags == tags &&
        other.price == price &&
        other.sizes == sizes &&
        other.colors == colors &&
        other.description == description &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        rating.hashCode ^
        tags.hashCode ^
        price.hashCode ^
        sizes.hashCode ^
        colors.hashCode ^
        description.hashCode ^
        image.hashCode;
  }
}
