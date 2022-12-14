import 'dart:convert';

class Cart {
  int id = 0;
  int userID;
  int productID;
  int quantity;
  String color;
  String size;
  Cart({
    required this.id,
    required this.userID,
    required this.productID,
    required this.quantity,
    required this.color,
    required this.size,
  });

  Cart copyWith({
    int? id,
    int? userID,
    int? productID,
    int? quantity,
    String? color,
    String? size,
  }) {
    return Cart(
      id: id ?? this.id,
      userID: userID ?? this.userID,
      productID: productID ?? this.productID,
      quantity: quantity ?? this.quantity,
      color: color ?? this.color,
      size: size ?? this.size,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userID': userID,
      'productID': productID,
      'quantity': quantity,
      'color': color,
      'size': size,
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      id: int.tryParse(map['id'].toString()) ?? 0,
      userID: int.tryParse(map['userID'].toString()) ?? 0,
      productID: int.tryParse(map['productID'].toString()) ?? 0,
      quantity: int.tryParse(map['quantity'].toString()) ?? 0,
      color: map['color'] as String,
      size: map['size'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) => Cart.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Cart(id: $id, userID: $userID, productID: $productID, quantity: $quantity, color: $color, size: $size)';
  }

  @override
  bool operator ==(covariant Cart other) {
    if (identical(this, other)) return true;

    return other.id == id && other.userID == userID && other.productID == productID && other.quantity == quantity && other.color == color && other.size == size;
  }

  @override
  int get hashCode {
    return id.hashCode ^ userID.hashCode ^ productID.hashCode ^ quantity.hashCode ^ color.hashCode ^ size.hashCode;
  }
}
