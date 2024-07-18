import 'package:flutter/material.dart';

class CreationDArticle extends StatefulWidget {
  const CreationDArticle({Key? key}) : super(key: key);

  @override
  _CreationDArticleState createState() => _CreationDArticleState();
}

class _CreationDArticleState extends State<CreationDArticle> {
  void _onContainerTap() {
    // Handle the tap event here
    print('Container tapped!');
  }

  String? _selectedRestaurantType;
  List<String> _restaurantTypes = ["Fast Food", "Fine Dining", "Cafe", "Casual Dining"];

  Widget _addimg() {
    return GestureDetector(
      onTap: _onContainerTap,
      child: Container(
        width: 150,
        height: 120,
        decoration: BoxDecoration(
          color: Color.fromRGBO(240, 245, 250, 1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(45.0),
          child: Image.asset(
            "assets/addpic.png",
            width: 15,
            height: 15,
          ),
        ),
      ),
    );
  }

  Widget _input() {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Color.fromRGBO(240, 245, 250, 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        ),
      ),
    );
  }

  Widget _button() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50.0),
      width: 250,
      height: 70,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 70, 3),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          'Sauvegarder',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Création d\'un Nouveau Article'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 15, right: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nom de votre Restaurant * :",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              _input(),
              SizedBox(
                height: 20,
              ),
              Text(
                "Ajouter des images *:",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  _addimg(),
                  SizedBox(width: 10),
                  _addimg(),
                  SizedBox(width: 10),
                  _addimg(),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Ajouter le Prix *:",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              _input(),
              SizedBox(
                height: 20,
              ),
              Text(
                "Ajouter les ingrédients * :",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(240, 245, 250, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: DropdownButton<String>(
                    value: _selectedRestaurantType,
                    hint: Text("Les ingrédients"),
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    underline: SizedBox(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedRestaurantType = newValue!;
                      });
                    },
                    items: _restaurantTypes.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Détails * :",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(240, 245, 250, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: _button(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
