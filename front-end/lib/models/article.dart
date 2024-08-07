import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Article{
  int? id;
  String? name;
  String? image;
  String? title;
  String? description;
  String? date;
  String? prix;

  Article({required this.date, required this.description, required this.id,  required this.name,
  required this.image, required this.prix, required this.title});
  factory Article.fromJson(Map<String, dynamic> item) {
    return Article(
      id: item['article_id'] as int?,
      name: item['nom'] as String?,
      image: item['image'] as String?,
      title: item['title'] as String?,
      description: item['description'] as String?,
      date: item['date'] as String?,
      prix: item['prix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'title': title,
      'description': description,
      'date': date,
      'prix': prix,
    };
  }
}