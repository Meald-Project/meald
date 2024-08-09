import 'package:flutter/material.dart';
import 'footer.dart';
import 'parametres_page.dart';
import 'home_page.dart';
import 'profile_page.dart';
import 'commande_details_page.dart'; // Assurez-vous d'importer votre nouvelle page

class CommandesPage extends StatefulWidget {
  @override
  _CommandesPageState createState() => _CommandesPageState();
}

class _CommandesPageState extends State<CommandesPage> {
  int _selectedIndex = 1; // Index de la page courante (par exemple, Commandes)

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Logique de navigation pour changer de page en fonction de l'index
      // Par exemple :
      if (index == 0) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else if (index == 2) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ProfilPage()),
        );
      } else if (index == 3) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ParametresPage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Commandes à Livrer'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              // Logique pour actualiser la liste des commandes
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: 8, // Nombre de commandes à afficher
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.assignment, color: Colors.white),
                ),
                title: Text('Commande #${index + 1}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Client: Client ${index + 1}'),
                    Text('Adresse: 456 Avenue Example'),
                    Text('Téléphone: 0123456789'),
                  ],
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.timer, color: Colors.orange),
                    SizedBox(height: 4),
                    Text('En attente', style: TextStyle(color: Colors.orange)),
                  ],
                ),
                onTap: () {
                  // Logique pour afficher les détails de la commande
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CommandeDetailsPage(),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: FooterWidget(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
