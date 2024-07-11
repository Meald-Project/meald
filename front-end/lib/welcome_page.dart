import 'package:flutter/material.dart';
const IconData arrow_circle_right_outlined = IconData(0xf05bd, fontFamily: 'MaterialIcons');


class WelcomePage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        _createRoute(FirstPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network('../images/Logo.gif',height:130,
        width:130,),
        
      ),
    );
  }
}



class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenue Cher Utilisateur',
                style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.black,
              )),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image and carousel indicator
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.network(
                  '../images/User.gif',
                  height: 250,
                  width: 250,
                  fit: BoxFit.cover,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildCarouselIndicator(active: true),
                      SizedBox(width: 8),
                      _buildCarouselIndicator(active: false),
                      SizedBox(width: 8),
                      _buildCarouselIndicator(active: false),
                      SizedBox(width: 8),
                      _buildCarouselIndicator(active: false),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Text
            Text(
              'Commandez vos plats préférés\n'
              'directement depuis votre téléphone.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 20),
            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end, // Align NEXT button to the right
              children: [
                // NEXT button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondPage()),
                    );
                  },
                  child: Text('NEXT =>'),
                ),
                SizedBox(width: 20),
              ],
            ),
            SizedBox(height: 10),
            // Skip text centered and grey
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home_page');
              },
              child: Text(
                'Skip this page',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    ); 
  }

  Widget _buildCarouselIndicator({required bool active}) {
    return Container(
      width: active ? 12 : 8,
      height: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: active ? Colors.blue : Colors.grey,
      ),
    );
  }
}
 

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bienvenue Cher Utilisateur',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image and carousel indicator
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.network(
                  '../images/Location.gif',
                  height: 250,
                  width: 250,
                  fit: BoxFit.cover,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildCarouselIndicator(active: false),
                      SizedBox(width: 8),
                      _buildCarouselIndicator(active: true),
                      SizedBox(width: 8),
                      _buildCarouselIndicator(active: false),
                      SizedBox(width: 8),
                      _buildCarouselIndicator(active: false),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            // Text
            Text(
              'Commandez vos plats préférés\n'
              'directement depuis votre téléphone.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 20.0),
            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // BACK button
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('<= BACK'),
                ),
                // NEXT button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      _createRoute(ThirdPage()),
                    );
                  },
                  child: Text('NEXT =>'),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            // Skip text centered and grey
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home_page');
              },
              child: Text(
                'Skip this page',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarouselIndicator({required bool active}) {
    return Container(
      width: active ? 12 : 8,
      height: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: active ? Colors.blue : Colors.grey,
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bienvenue Cher Utilisateur',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image and carousel indicator
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.network(
                  '../images/Driver.gif',
                  height: 250,
                  width: 250,
                  fit: BoxFit.cover,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildCarouselIndicator(active: false),
                      SizedBox(width: 8),
                      _buildCarouselIndicator(active: false),
                      SizedBox(width: 8),
                      _buildCarouselIndicator(active: true),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            // Text
            Text(
              'Commandez vos plats préférés\n'
              'directement depuis votre téléphone.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 20.0),
            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // BACK button
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('<= BACK'),
                ),
                // NEXT button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      _createRoute(FourthPage()),
                    );
                  },
                  child: Text('NEXT =>'),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            // Skip text centered and grey
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home_page');
              },
              child: Text(
                'Skip this page',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarouselIndicator({required bool active}) {
    return Container(
      width: active ? 12 : 8,
      height: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: active ? Colors.blue : Colors.grey,
      ),
    );
  }
}
        

class FourthPage extends StatefulWidget {
  @override
  _FourthPageState createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  int selectedButtonIndex = -1; // Initialize with -1 (no button selected)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Etes Vous ?'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedButtonIndex = 0; 
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedButtonIndex == 0 ? Colors.orange : Colors.white,
              ),
              child: Text(
                'Restaurant',
                style: TextStyle(
                  color: selectedButtonIndex == 0 ? Colors.white : Colors.orange,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedButtonIndex = 1; // Select the second button
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedButtonIndex == 1 ? Colors.orange : Colors.white,
              ),
              child: Text(
                'Client',
                style: TextStyle(
                  color: selectedButtonIndex == 1 ? Colors.white : Colors.orange,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedButtonIndex = 2; // Select the third button
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedButtonIndex == 2 ? Colors.orange : Colors.white,
              ),
              child: Text(
                'Livreur',
                style: TextStyle(
                  color: selectedButtonIndex == 2 ? Colors.white : Colors.orange,
                ),
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home_page');
              },
              child: Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}

Route _createRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero; 
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
