import 'dart:convert';

class User {
  int? id;
  String? name;
  String? password;

  User({
    this.id,
    this.name,
    this.password,
  });

  User copyWith({
    int? id,
    String? name,
    String? password,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id']?.toInt(),
      name: map['name'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, name: $name, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User && other.id == id && other.name == name && other.password == password;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ password.hashCode;
}
