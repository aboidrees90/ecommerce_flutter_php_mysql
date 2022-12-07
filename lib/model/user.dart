import 'dart:convert';

class User {
  int? id;
  String? name;
  String? email;

  User({this.id, this.name, this.email});

  User copyWith({int? id, String? name, String? email}) {
    return User(id: id ?? this.id, name: name ?? this.name, email: email ?? this.email);
  }

  Map<String, dynamic> toMap() => <String, dynamic>{'id': id, 'name': name, 'email': email};

  factory User.fromMap(Map<String, dynamic> map) {
    return User(id: int.tryParse(map['id'].toString()), name: map['name'] as String, email: map['email'] as String?);
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(id: $id, name: $name, email: $email)';

  @override
  bool operator ==(covariant User other) => (identical(this, other)) ? true : other.id == id && other.name == name && other.email == email;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ email.hashCode;
}
