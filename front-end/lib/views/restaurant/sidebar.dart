import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 230, // Hauteur du DrawerHeader
            color: Colors.orange,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'My Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Available Balance',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '\$500.00',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Withdraw'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.orange, backgroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0), // Ajustez le padding
                      minimumSize: Size(100, 36), // Largeur et hauteur minimales
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0), // Coins arrondis
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Personal Info'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('Withdrawal History'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text('Number of Orders'),
            trailing: Text('29K'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.rate_review),
            title: Text('User Reviews'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Log Out'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
