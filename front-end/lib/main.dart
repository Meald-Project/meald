import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/client/home_page.dart';
import 'views/restaurant/home_page.dart';
import 'views/livreur/home_page.dart';
import 'views/welcome_page.dart';
import 'views/login.dart';
import 'views/restaurant/creation_de_restaurant.dart';
import 'views/restaurant/creation_d_article.dart';
import '../widgets/themes/theme_provider.dart';
import 'views/signup.dart';
import 'views/restaurant/liste.dart';
import 'views/restaurant/article_details.dart';
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
          debugShowCheckedModeBanner: false, 
          title: 'Flutter App',
          theme: themeProvider.currentTheme,
          initialRoute: '/',
          routes: {
            // '/': (context) => WelcomePage(),
            '/': (context) => const ArticleDetails(),
            // '/homePage_client': (context) => HomePageClient(),
            // '/homePage_livreur': (context) => HomePageLivreur(),
            // '/homePage_restaurant': (context) => HomePageRestaurant(),
          },
        );
      },
    );
  }
}