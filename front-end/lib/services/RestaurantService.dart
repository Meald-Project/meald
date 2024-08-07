import 'dart:convert';

import 'package:http/http.dart' as http;


class UserService{
  
  static const Url = 'http://localhost:3000/api/restaurants';
  static const headers = {
    'Content-type': 'application/json'
  };

  static Future<dynamic> getRestoDetails(int id) async {
    final response = await http.get(
      Uri.parse('${Url}/restaurant/$id'),
    );
    if (response.statusCode == 200) {
      print(response.body);
      return json.decode(response.body);
    } else {
      print('Error: ${response.reasonPhrase}');
    }
  }
}