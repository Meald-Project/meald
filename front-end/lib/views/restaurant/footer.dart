import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/Home': (context) => SimplePage('Home Page'),
        '/List': (context) => SimplePage('List Page'),
        '/Add': (context) => SimplePage('Add Page'),
        '/Notifications': (context) => SimplePage('Notifications Page'),
        '/Profile': (context) => SimplePage('Profile Page'),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Home Page')),
      bottomNavigationBar: Footer(),
    );
  }
}

class Footer extends StatefulWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  int _selectedIndex = -1; // Index of the currently selected icon

  void _onIconTap(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.of(context).pushNamed('/homePage_restaurant');
        break;
      case 1:
        Navigator.of(context).pushNamed('/List');
        break;
      case 2:
        Navigator.of(context).pushNamed('/creation_article');
        break;
      case 3:
        Navigator.of(context).pushNamed('/Notif');
        break;
      case 4:
        Navigator.of(context).pushNamed('/Profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () => _onIconTap(0),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              child: Icon(
                Icons.home,
                size: 30,
                color: _selectedIndex == 0
                    ? Color.fromARGB(203, 255, 70, 3)
                    : Colors.black,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => _onIconTap(1),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              child: Icon(
                Icons.list,
                size: 30,
                color: _selectedIndex == 1
                    ? Color.fromARGB(203, 255, 70, 3)
                    : Colors.black,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => _onIconTap(2),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: _selectedIndex == 2
                    ? Color.fromARGB(49, 255, 70, 3)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                Icons.add,
                size: 30,
                color: _selectedIndex == 2
                    ? Color.fromARGB(203, 255, 70, 3)
                    : Colors.black,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => _onIconTap(3),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              child: Icon(
                Icons.notifications,
                size: 30,
                color: _selectedIndex == 3
                    ? Color.fromARGB(203, 255, 70, 3)
                    : Colors.black,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => _onIconTap(4),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              child: Icon(
                Icons.person,
                size: 30,
                color: _selectedIndex == 4
                    ? Color.fromARGB(203, 255, 70, 3)
                    : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SimplePage extends StatelessWidget {
  final String title;

  SimplePage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('This is the $title')),
    );
  }
}
