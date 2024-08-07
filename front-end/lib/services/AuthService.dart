
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class Authservice{
  static const Url = 'http://localhost:3000/api/auth';
  static const headers = {
    'Content-type': 'application/json'
  };

static Future<void> login(String email, String password, BuildContext context) async {
  try {
    final data = {'email': email, 'motdepasse': password};
    final response = await http.post(
      Uri.parse('$Url/login'),
      headers: headers,
      body: json.encode(data),
    );

    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);

      final user = responseData['user'];
      final role = user['role'] as String?;

      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setInt('yey', user['user_id'] as int);
      

      switch (role) {
        case 'client':
          Navigator.of(context).pushReplacementNamed('/homePageClient');
          break;
        case 'resto':
          Navigator.of(context).pushReplacementNamed('/homePage_restaurant');
          break;
        case 'livreur':
          Navigator.of(context).pushReplacementNamed('/homePage_livreur');
          break;
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Échec de la connexion ! Veuillez réessayer.')),
      );
    }
  } catch (e) {
    print('Error: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Une erreur est survenue.')),
    );
  }
}

static Future<void> signup(String name, String email, String password, BuildContext context) async {
    try {
      final data = {
        'nom': name,
        'email': email,
        'motdepasse': password,
        'role': 'resto',
      };
      final response = await http.post(
        Uri.parse('$Url/signup'),
        headers: headers,
        body: json.encode(data),
      );

      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        Navigator.of(context).pushReplacementNamed('/Login');
      } else {
        final responseData = json.decode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(responseData['message'] ?? 'Échec')),
        );
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Une erreur est survenue.')),
      );
    }
  }



}