import 'package:flutter/material.dart';


class HomePageRestaurant extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<HomePageRestaurant> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        _createRoute(HomePageR()), // Calling _createRoute method here
      );
    });
  }

  // Define _createRoute method to create a MaterialPageRoute
  Route _createRoute(Widget page) {
    return MaterialPageRoute(
      builder: (context) => page,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network(
          '../images/Logo.gif',
          height: 130,
          width: 130,
        ),
      ),
    );
  }
}

class HomePageR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Text('Welcome to the Home Page!'),
      ),
    );
  }
}