import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class HomePageClient extends StatefulWidget {
  @override
  _HomePageClientState createState() => _HomePageClientState();
}

class _HomePageClientState extends State<HomePageClient> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePageR()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          '../assets/Logo.gif', // Adjusted path for local assets
          height: 130,
          width: 130,
        ),
      ),
    );
  }
}

class HomePageR extends StatefulWidget {
  @override
  _HomePageRState createState() => _HomePageRState();
}

class _HomePageRState extends State<HomePageR> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView( child:Column(
        children: [
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 0.0), 
  child: Container(
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.onError,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 5,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.only(top: 30.0, left: 16.0, right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      showCupertinoModalPopup(
                        context: context,
                        builder: (BuildContext context) => SidebarPopup(),
                      );
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 226, 225, 225),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Icon(
                        Icons.menu,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bonjour, Assem',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'assem@gmail.com',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  // Handle cart click
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 2, 1, 49),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Icon(
                    Icons.shopping_bag,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    ),
  ),
), SizedBox(height: 10),
        
          Container(
          padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
             color: Theme.of(context).colorScheme.onError,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
      width: 370, 
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search button
            },
          ),
          filled: true,
          fillColor: Color.fromARGB(255, 214, 214, 214),
          hintText: 'Recherchez Des Plats Où Des Restaurants..',  
          hintStyle: TextStyle(fontSize: 12,color: Theme.of(context).colorScheme.tertiary, ), 
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
      ),
    ),
SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 37,
                          height: 37,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Nos Categories',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        // Handle "voir plus" click
                      },
                      child: Text(
                        'voir plus',
                        style: TextStyle(
                          color: Colors.grey,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
CarouselSlider(
          options: CarouselOptions(
            height: 40, // Adjust height as needed
            initialPage: 0,
            viewportFraction: 0.3, // Adjust to control space between items
            enlargeCenterPage: false, // Ensure items are not enlarged
            enableInfiniteScroll: false,
            aspectRatio: 2.0,
            scrollDirection: Axis.horizontal, // Ensure horizontal scrolling
            reverse: false, // Ensure items scroll from left to right
          ),
          items: [
            'All',
            'Petit Dej',
            'Plats',
            'Smoothies',
          ].map((item) => Container(
            margin: EdgeInsets.symmetric(horizontal: 4), // Reduce space between items
            child: Container(
              decoration: BoxDecoration(
                color: item == 'All' ? Colors.orange : Color.fromARGB(255, 217, 215, 215),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  item,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 14, // Adjust font size if needed
                  ),
                ),
              ),
            ),
          )).toList(),
        ),
        SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 37,
                          height: 37,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Special Aujourd'hui",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        // Handle "voir plus" click
                      },
                      child: Text(
                        'voir plus',
                        style: TextStyle(
                          color: Colors.grey,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 250,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    enableInfiniteScroll: true,
                  ),
                  items: [
                    Container(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                  child: Image.network(
                                    'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Lula_kebab_2.jpg/640px-Lula_kebab_2.jpg',
                                    width: 300, // Adjust width as needed
                                    height: 200, // Adjust height as needed
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  'Kebab Mechhwi',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Text(
                                'Prix : 250 Dt',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                'offre speciale sur le kebeb',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(height: 8),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ].map((item) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                    child: item,
                  )).toList(),
                ),
                SizedBox(height: 20),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 37,
                          height: 37,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Restaurants Ouverts',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        // Handle click
                      },
                      child: Text(
                        'voir plus',
                        style: TextStyle(
                          color: Colors.grey,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
      margin: EdgeInsets.symmetric(vertical: 10), // Add margin to separate items
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch content to fill width
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Lula_kebab_2.jpg/640px-Lula_kebab_2.jpg',
                  width: double.infinity, // Use full width of container
                  height: 200, // Fixed height
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
                  children: [
                    Text(
                      'Restaurant ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 5), // Space between text lines
                    Text(
                      'Prix : 250 Dt',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14, // Slightly larger font size for price
                      ),
                    ),
                    SizedBox(height: 5), // Space between text lines
                    Text(
                      'Offre spéciale sur le kebab',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    )  
              ],
            ),
            
          ),
        ],
      ),
    ),
     bottomNavigationBar: BottomNavBar(),
    )
  ;}
}

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Acceuil',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favories',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Charte',
        ),
      ],
      selectedItemColor: Colors.orange, 
      unselectedItemColor:Theme.of(context).colorScheme.secondary, 
      currentIndex: 0, 
      onTap: (int index) {

      },
    );
  }
}

class SidebarPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        width: 180,
        height: MediaQuery.of(context).size.height,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.orange,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 25, // Adjust the radius as needed
                      backgroundImage: NetworkImage(
                          'https://www.iconpacks.net/icons/2/free-user-icon-3296-thumb.png'),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Assem Ben Ahmed',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'assem@gmail.com',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              buildDrawerItem(Icons.person, 'Mon Profil'),
              buildDrawerItem(Icons.credit_card, 'Ma Carte'),
              buildDrawerItem(Icons.favorite, 'Mes Favories'),
              buildDrawerItem(Icons.history, 'Historique'),
              buildDrawerItem(Icons.location_on, 'Localisations'),
              buildDrawerItem(Icons.settings, 'Paramètres'),
              buildDrawerItem(Icons.exit_to_app, 'Deconnecter'),
              // Add more list items as needed
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDrawerItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30, // Adjust the size as needed
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 12,
        ),
      ),
      onTap: () {
        // Add functionality here
        print('Tapped on $title');
      },
    );
  }
}