import 'package:flutter/material.dart';
import 'footer.dart';
import 'commandes_page.dart';
import 'home_page.dart';
import 'profile_page.dart';
class ParametresPage extends StatefulWidget {
  @override
  _ParametresPageState createState() => _ParametresPageState();
}

class _ParametresPageState extends State<ParametresPage> {
  int _selectedIndex = 3; // Index pour la page des paramètres

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Logique de navigation
      if (index == 0) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else if (index == 1) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => CommandesPage()),
        );
      } else if (index == 2) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ProfilPage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paramètres'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Changer le mot de passe'),
            onTap: () {
              // Logique pour changer le mot de passe
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            onTap: () {
              // Logique pour les notifications
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Langue'),
            onTap: () {
              // Logique pour changer la langue
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Aide'),
            onTap: () {
              // Logique pour accéder à l'aide
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Se déconnecter'),
            onTap: () {
              // Logique pour la déconnexion
            },
          ),
        ],
      ),
      bottomNavigationBar: FooterWidget(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
