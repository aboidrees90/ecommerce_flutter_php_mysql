import 'dart:convert';

class User {
  int? id;
  String? name;
  String? email;
  String? type;

  User({this.id, this.name, this.email, this.type});

  User copyWith({int? id, String? name, String? email, String? type}) {
    return User(id: id ?? this.id, name: name ?? this.name, email: email ?? this.email, type: type ?? this.type);
  }

  Map<String, dynamic> toMap() => <String, dynamic>{'id': id, 'name': name, 'email': email, 'type': type};

  factory User.fromMap(Map<String, dynamic> map) {
    return User(id: int.tryParse(map['id'].toString()), name: map['name'] as String, email: map['email'] as String?, type: map['type'] as String?);
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(id: $id, name: $name, email: $email, type: $type)';

  @override
  bool operator ==(covariant User other) =>
      (identical(this, other)) ? true : other.id == id && other.name == name && other.email == email && other.type == type;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ email.hashCode ^ type.hashCode;
}
