import 'package:flutter/material.dart';
import 'footer.dart';

class TableauDebord extends StatefulWidget {
  const TableauDebord({Key? key}) : super(key: key);

  @override
  _TableauDebordState createState() => _TableauDebordState();
}

class _TableauDebordState extends State<TableauDebord> {
  Widget _statistic(String stat, String type) {
    return Container(
      width: 200,
      height: 100,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 203, 230, 252),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            stat,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            type,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                Icon(Icons.location_city),
                SizedBox(width: 4),
                Text('Localisation'),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.account_circle),
              onPressed: () {
                // Handle profile icon press
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _statistic("Stat 1", "Orders en Cours"),
                const SizedBox(width: 50),
                _statistic("Stat 2", "Demande de Commande"),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _statistic("Stat 3", "Clients"),
                const SizedBox(width: 50),
                _statistic("Stat 4", "Order Request"),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
