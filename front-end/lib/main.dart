import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/client/home_page.dart';
import 'views/client/profile_page.dart';
import 'views/restaurant/home_page.dart';
import 'views/livreur/home_page.dart';
import 'views/welcome_page.dart';
import 'views/signup.dart';
import 'views/restaurant/creation_de_restaurant.dart';
import 'views/restaurant/creation_d_article.dart';
import '../widgets/themes/theme_provider.dart';
import 'views/login.dart';
import 'views/signup.dart';
import 'views/restaurant/liste.dart';
import 'views/restaurant/article_details.dart';
import 'views/restaurant/tableau_debord.dart';
import 'views/restaurant/notification.dart';

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
          title: 'meald',
          theme: themeProvider.currentTheme,
          initialRoute: '/',
          routes: {
            '/': (context) => WelcomePage(),
            '/creation_article': (context) => const CreationDArticle(),
            '/homePage_client': (context) => HomePageClient(),
            '/profilePage_client': (context) => ProfilePage(),
            '/homePage_livreur': (context) => HomePageLivreur(),
            '/homePage_restaurant': (context) => const TableauDebord (),
            '/Signup': (context) => Signup(),
            '/Login': (context) => Login(),
            '/Role': (context) => FourthPage(),
            //'/': (context) => const TableauDebord (),

          },
        );
      },
    );
  }
}