import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark().copyWith(
    primary: const Color(0xffffa500), 
    secondary: Color.fromARGB(255, 255, 255, 255), 
    surface: Color.fromARGB(255, 3, 2, 16), 
    error: const Color(0xffd32f2f),
    onError: Colors.white, 
  ),
);
