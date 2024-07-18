import 'package:flutter/material.dart';

class CreationDeRestaurant extends StatefulWidget {
  const CreationDeRestaurant({Key? key}) : super(key: key);

  @override
  _CreationDeRestaurantState createState() => _CreationDeRestaurantState();
}

class _CreationDeRestaurantState extends State<CreationDeRestaurant> {
  void _onContainerTap() {
    // Handle the tap event here
    print('Container tapped!');
  }
  String? _selectedRestaurantType;
  List<String>_restaurantTypes =["Fast Food", "Fine Dining", "Cafe", "Casual Dining"];

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
          'Sauvgarder',
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
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Création De Restaurant",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Ajouter votre logo",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: _onContainerTap,
              child: Container(
                width: 190,
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
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Nom de votre Restaurant * :",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                width: 300,
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(240, 245, 250, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  ),
                )),
                SizedBox(height: 20,),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(children: [
                Text(
                  "Num CIN * :",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(240, 245, 250, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    ),
                  ),
                ),
              ]),
              SizedBox(
                width: 50,
              ),
              Column(children: [
                Text(
                  "Date CIN * :",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(240, 245, 250, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    ),
                  ),
                ),
              ]),
            ]),
            SizedBox(height: 20,),
            Text("Type de votre Restaurant * :",
            style: TextStyle(
              fontSize: 18,
            ),
            ),
            SizedBox(height: 10,),
            Container(
              width: 300,
              height: 50,
              decoration: BoxDecoration(
                    color: Color.fromRGBO(240, 245, 250, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: DropdownButton<String>(
                      value: _selectedRestaurantType,
                      hint: Text("selectionner un type"),
                      
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      underline: SizedBox(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedRestaurantType = newValue!;
                        });
                      },
                      items: _restaurantTypes.map<DropdownMenuItem<String>>((String value){
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  )
            ),
            SizedBox(height: 20,),
            Text(
              "Ajouter votre Pattente * :",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: _onContainerTap,
              child: Container(
                width: 190,
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
            ),
            SizedBox(height: 40,),
            _button()
          ],
        ),
      ),
    );
  }
}
