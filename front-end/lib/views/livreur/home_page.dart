import 'package:flutter/material.dart';


class HomePageLivreur extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<HomePageLivreur> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        _createRoute(HomePageL()), // Calling _createRoute method here
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

class HomePageL extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Text('Welcome to the Home Page! liv'),
      ),
    );
  }
}