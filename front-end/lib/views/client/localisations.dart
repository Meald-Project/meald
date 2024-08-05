import 'package:flutter/material.dart';

class LocalisationsPage extends StatelessWidget {
  final List<String> locations = [
    'Restaurant Marhabe',
    'Restaurant BestVoice',
    // You can add more locations here if needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mes Localisations'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                _showAddLocationDialog(context);
              },
              child: Text(
                'Ajouter une nouvelle localisation',
                style: TextStyle(color: Colors.orange, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: locations.length,
              itemBuilder: (context, index) {
                return ChartItem(location: locations[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showAddLocationDialog(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('Ajouter une nouvelle localisation'),
        content: TextField(
          controller: _controller,
          decoration: InputDecoration(hintText: 'Nom de la localisation'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog
            },
            child: Text('Annuler'),
          ),
          TextButton(
            onPressed: () {
              // Implement add location logic here
              // Example: locations.add(_controller.text); // This line should be inside a StatefulWidget
              Navigator.of(context).pop(); // Close dialog
            },
            child: Text('Ajouter'),
          ),
        ],
      ),
    );
  }
}


class ChartItem extends StatelessWidget {
  final String location;

  const ChartItem({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: Colors.orange), // Orange border color
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.orange),
                SizedBox(width: 8.0),
                // Limit text to 12 characters
                Text(
                  _truncateLocation(location),
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600, color: Colors.orange),
                ),
              ],
            ),
            PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'edit') {
                  // Handle edit action
                } else if (value == 'delete') {
                  // Handle delete action
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Text('Êtes-vous sûr de vouloir supprimer cette localisation ?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close dialog
                          },
                          child: Text('Annuler'),
                        ),
                        TextButton(
                          onPressed: () {
                            // Implement delete logic here
                            Navigator.of(context).pop(); // Close dialog
                          },
                          child: Text('Oui'),
                        ),
                      ],
                    ),
                  );
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'edit',
                  child: ListTile(
                    leading: Icon(Icons.edit, color: Colors.orange),
                    title: Text('Modifier', style: TextStyle(color: Colors.orange)),
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'delete',
                  child: ListTile(
                    leading: Icon(Icons.delete, color: Colors.orange),
                    title: Text('Supprimer', style: TextStyle(color: Colors.orange)),
                  ),
                ),
              ],
              icon: Icon(Icons.more_vert, color: Colors.orange),
            ),
          ],
        ),
      ),
    );
  }

  String _truncateLocation(String location) {
    if (location.length <= 12) {
      return location;
    } else {
      return location.substring(0, 12) + '...';
    }
  }
}