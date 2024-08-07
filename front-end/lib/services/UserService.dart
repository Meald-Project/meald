// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class UserService{
  
  static const Url = 'http://localhost:3000/api';
  static const headers = {
    'Content-type': 'application/json'
  };

  static Future<dynamic> getUserDetails(int id) async {
    final response = await http.get(
      Uri.parse('${Url}/users/user/$id'),
    );
    if (response.statusCode == 200) {
      print(response.body);
      return json.decode(response.body);
    } else {
      print('Error: ${response.reasonPhrase}');
    }
  }

static Future<void> login(String email, String password, BuildContext context) async {
  try {
    final data = {'email': email, 'motdepasse': password};
    final response = await http.post(
      Uri.parse('$Url/auth/login'),
      headers: headers,
      body: json.encode(data),
    );

    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);

      // Extract user details safely
      final user = responseData['user'];
      final role = user['role'] as String?;

      SharedPreferences pref = await SharedPreferences.getInstance();
      if (user['user_id'] != null) {
        pref.setInt('yey', user['user_id'] as int);
      } else {
        // Handle missing user_id appropriately
        print('User ID is null');
      }

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



}