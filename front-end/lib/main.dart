import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/client/home_page.dart';
import 'views/restaurant/home_page.dart';
import 'views/livreur/home_page.dart';
import 'views/update_profile.dart';
import 'views/welcome_page.dart';
import 'views/login.dart';
import '../widgets/themes/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ThemeProvider>(
      create: (_) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Flutter App',
          theme: themeProvider.currentTheme,
          initialRoute: '/',
          routes: {
            '/': (context) => WelcomePage(),
            '/update_Profile': (context) => UpdateProfile(),
            '/homePage_client': (context) => HomePageClient(),
            '/homePage_livreur': (context) => HomePageLivreur(),
            '/homePage_restaurant': (context) => HomePageRestaurant(),
          },
        );
      },
    );
  }
}