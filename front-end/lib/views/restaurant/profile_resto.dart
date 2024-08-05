import 'package:flutter/material.dart';

class ProfileResto extends StatefulWidget {
  const ProfileResto({Key? key}) : super(key: key);

  @override
  _ProfileRestoState createState() => _ProfileRestoState();
}

class _ProfileRestoState extends State<ProfileResto> {
  String _selectedCategory = "";

  Widget _categ(String category) {
    bool isSelected = _selectedCategory == category;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCategory = category;
        });
      },
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width * 0.25,
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Color.fromARGB(255, 255, 70, 3),
            borderRadius: BorderRadius.circular(10),
            border: isSelected
                ? Border.all(color: Color.fromARGB(255, 255, 70, 3), width: 2)
                : null,
            boxShadow: isSelected
                ? null
                : [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 4),
                    ),
                  ],
          ),
          child: Center(
            child: Text(
              category,
              style: TextStyle(
                color: isSelected ? Color.fromARGB(255, 255, 70, 3) : Colors.white,
                shadows: isSelected
                    ? null
                    : [
                        Shadow(
                          color: Colors.black.withOpacity(0.3),
                          offset: Offset(0, 1),
                          blurRadius: 2,
                        ),
                      ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _article() {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;

  return Container(
    height: screenHeight * 0.35,
    width: screenWidth * 0.4,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/test.png",
          width: screenWidth * 0.3, // Adjust width of the image
          height: screenHeight * 0.15, // Adjust height of the image
          fit: BoxFit.cover,
        ),
        SizedBox(height: screenHeight * 0.015),
        Text(
          "Article",
          style: TextStyle(
            fontSize: screenWidth * 0.04, // Responsive font size
            color: Colors.black,
          ),
        ),
        SizedBox(height: screenHeight * 0.015),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
              child: Text(
                "prix",
                style: TextStyle(
                  fontSize: screenWidth * 0.04, // Responsive font size
                  color: Colors.black,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.add,
                color: Color.fromARGB(255, 255, 70, 3),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ],
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            pinned: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.3,
            flexibleSpace: FlexibleSpaceBar(
              title: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white.withOpacity(0.7),
                ),
                child: Text(
                  'Nom Resto',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              background: Image.asset(
                'assets/test.png',
                fit: BoxFit.cover,
              ),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.account_circle, color: Colors.black),
                onPressed: () {
                  // Action pour l'icône de profil
                },
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, color: Color.fromARGB(255, 255, 70, 3), size: MediaQuery.of(context).size.width * 0.08),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                      Text('Notes', style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04)),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.local_shipping, color: Color.fromARGB(255, 255, 70, 3), size: MediaQuery.of(context).size.width * 0.08),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                      Text('Prix livraison', style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04)),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.schedule, color: Color.fromARGB(255, 255, 70, 3), size: MediaQuery.of(context).size.width * 0.08),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                      Text('Délai livraison', style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "À Propos :",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: double.infinity,
                    color: Color.fromARGB(86, 238, 238, 238),
                    child: Center(child: Text("nouveau restaurant ....................")),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Text(
                    "Categories :",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          _categ("Burger"),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                          _categ("Sandwich"),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                          _categ("Pizza"),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                          _categ("Sushi"),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                          _categ("Pasta"),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  _article(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
