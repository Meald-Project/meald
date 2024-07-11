import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light().copyWith(
    primary: const Color(0xffffa500), 
    secondary: const Color(0xff000000), 
    surface: Color.fromARGB(255, 252, 252, 252), 
    error: const Color(0xffd32f2f),
    onError: Color.fromARGB(255, 105, 1, 1), 
  ),
);
