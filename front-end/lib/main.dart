import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meald/views/login.dart';
import 'views/client/home_page.dart';
import 'views/client/profile_page.dart';
import 'views/restaurant/home_page.dart';
import 'views/livreur/home_page.dart';
import 'views/welcome_page.dart';
import 'views/signup.dart';
import 'views/restaurant/creation_de_restaurant.dart';
import 'views/restaurant/creation_d_article.dart';
import 'views/restaurant/liste.dart';
import 'views/restaurant/article_details.dart';
import 'views/restaurant/tableau_debord.dart';
import 'views/restaurant/notification.dart';
import 'views/restaurant/profile_resto.dart';
import 'package:meald/viewmodels/footer_view_model.dart'; // Assurez-vous d'importer le ViewModel
import 'package:provider/provider.dart';
import '../widgets/themes/theme_provider.dart';

void main() async{
  await GetStorage.init(); // Initialize GetStorage
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (_) => ThemeProvider(),
        ),
        ChangeNotifierProvider<FooterViewModel>(
          create: (_) => FooterViewModel(),
        ),
      ],
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
            '/homePageClient': (context) => HomePageClient(),
            '/profilePage_client': (context) => ProfilePage(),
            '/homePage_livreur': (context) => HomePageLivreur(),
            '/homePage_restaurant': (context) => const TableauDebord(),
            '/Signup': (context) => Signup(),
            '/Login': (context) => Login(),
            '/Role': (context) => FourthPage(),
            '/Creatresto': (context) => CreationDeRestaurant(),
            '/Notif': (context) => NotificationScreen(),
            '/Profile': (context) => ProfileResto(),
            '/List': (context) => Liste(),
          },
        );
      },
    );
  }
}
