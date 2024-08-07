import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Resto {
  int? id;
  String? nameResto;
  String? address;
  String? phone;
  String? email;
  String? photoUrl;
  String? type;
  String? pattante;
  Bool? openNow;
  String? description;
  int? rating;
  String? lat;
  String? lng;


  Resto({required this.id, required this.nameResto, required this.address ,required this.phone, required this.email,
 required this.description, required this.lat, required this.lng,
   required this.openNow, required this.pattante, required this.photoUrl, required this.rating, required this.type });


  factory Resto.fromJson(Map<String, dynamic> item) {
    return Resto(
      id: item['restaurant_id'] as int?,
      nameResto: item['nom'] as String?,
      address: item['adress'] as String?,
      phone: item['phone'] as String?,
      email: item['email'] as String?,
      photoUrl: item['photoUrl'] as String?,
      type: item['type'] as String?,
      pattante: item['pattante'] as String?,
      openNow: item['openNow'] as Bool?,
      description: item['description'] as String?,
      rating: item['rating'] as int?,
      lat: item['lat'] as String?,
      lng: item['lng'] as String?,
    );
   }

     Map<String, dynamic> toJson() {
    return {
      'restaurant_id': id,
      'nom': nameResto,
      'adress': address,
      'phone': phone,
      'email': email,
      'photoUrl': photoUrl,  
      'type': type,          
      'pattante': pattante,  
      'openNow': openNow,    
      'description': description, 
      'rating': rating,       
      'lat': lat,             
      'lng': lng,             
    };
  }
}