import 'dart:convert';

import 'package:ecommerce_php/model/product.dart';

class Favorite {
  int? id;
  int userID;
  int productID;

  Product? product;

  Favorite({
    this.id,
    required this.userID,
    required this.productID,
    this.product,
  });

  Favorite copyWith({int? id, int? userID, int? productID, Product? product}) {
    return Favorite(
      id: id ?? this.id,
      userID: userID ?? this.userID,
      productID: productID ?? this.productID,
      product: product ?? this.product,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': (id ?? 0).toString(),
      'userID': userID.toString(),
      'productID': productID.toString(),
      'product': product?.toJson() ?? "{}",
    };
  }

  factory Favorite.fromMap(Map<String, dynamic> map) {
    return Favorite(
      id: int.tryParse(map['id'].toString()) ?? 0,
      userID: int.tryParse(map['userID'].toString()) ?? 0,
      productID: int.tryParse(map['productID'].toString()) ?? 0,
      product: map['product'] != null ? Product.fromJson(map['product']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Favorite.fromJson(String source) => Favorite.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Favorite(id: $id, userID: $userID, productID: $productID, product: ${product.toString()})';
  }

  @override
  bool operator ==(covariant Favorite other) {
    if (identical(this, other)) return true;

    return other.id == id && other.userID == userID && other.productID == productID && other.product == product;
  }

  @override
  int get hashCode => id.hashCode ^ userID.hashCode ^ productID.hashCode ^ product.hashCode;
}
