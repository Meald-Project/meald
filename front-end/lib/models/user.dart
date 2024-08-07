import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class User {
  int? id;
  String? name;
  String? email;
  String? password;
  String? role;
  String? adresse;
  String? telephone;

  User({
    this.id,
    this.name,
    this.email,
    this.password,
    this.role,
    this.adresse,
    this.telephone,
  });

  factory User.fromJson(Map<String, dynamic> item) {
    return User(
      id: item['user_id'] as int?,
      email: item['email'] as String?,
      name: item['nom'] as String?,
      password: item['motdepasse'] as String?,
      adresse: item['addresse'] as String?,
      role: item['role'] as String?,
      telephone: item['telephone'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "nom": name,
      "addresse": adresse,
      "telephone": telephone,
      "role": role,
    };
  }
}
