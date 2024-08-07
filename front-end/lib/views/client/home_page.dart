import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meald/models/user.dart';
import 'package:meald/services/UserService.dart';
import 'package:meald/viewmodels/user_view_model.dart';
import 'package:meald/views/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../chart.dart';
import 'favoris_page.dart';
import 'historique_page.dart';
import 'localisations.dart';
import 'parametres.dart';
import 'profile_page.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
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
          label: 'Favoris',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag),
          label: 'Sac',
        ),
      ],
      selectedItemColor: Colors.orange,
      unselectedItemColor: Theme.of(context).colorScheme.secondary,
      currentIndex: _currentIndex,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
        });

        switch (index) {
          case 1:
            Navigator.of(context).pushNamed('/profilePage_client');
            break;
        }
      },
    );
  }
}

class SidebarPopup extends StatefulWidget {
  @override
  _SidebarPopupState createState() => _SidebarPopupState();
}

class _SidebarPopupState extends State<SidebarPopup> {
  User user = User(
    id: 0,
    email: '',
    name: '',
    password: '',
    adresse: '',
    role: '',
    telephone: '',
  );

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  fetchUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var id = prefs.getInt("yey");

    print("id:$id");
    if (id != null) {
      var response = await UserService.getUserDetails(id);
      setState(() {
        user = User.fromJson(response);
      });
    }
  }

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
              Container(
                color: Colors.orange,
                height: 220,
                child: DrawerHeader(
                  padding: EdgeInsets.all(0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 60),
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                          'https://www.iconpacks.net/icons/2/free-user-icon-3296-thumb.png',
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        user.name??'Nom inconnu',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        user.email?? 'Email inconnu',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 100),
              buildDrawerItem(context, Icons.favorite, 'Mes Favories', FavorisPage()),
              buildDrawerItem(context, Icons.history, 'Historique', HistoryPage()),
              buildDrawerItem(context, Icons.location_on, 'Localisations', LocalisationsPage()),
              buildDrawerItem(context, Icons.settings, 'Paramètres', ParametresPage()),
              buildDrawerItem(context, Icons.exit_to_app, 'Deconnecter', Login()),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDrawerItem(BuildContext context, IconData icon, String title, Widget page) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 12,
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}

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
          'assets/Logo.gif',
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
  int _currentIndex = 0;


  final List<Widget> _pages = [      
      HomeScreen(),
      ProfilePage(),
      FavorisPage(),
      ChartPage(),
    ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
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
            label: 'Favoris',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Sac',
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  User user = User(
    id: 0,
    email: '',
    name: '',
    password: '',
    adresse: '',
    role: '',
    telephone: '',
  );

@override
  void initState() {
    super.initState();
    fetchUser();
  }

  fetchUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("Stored keys: ${prefs.getKeys()}");

        var id = prefs.getInt("yey");

    print("id:$id");
    if (id != null) {
      var response = await UserService.getUserDetails(id );
      setState(() {
        user = User.fromJson(response);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Column(
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
                                    user.name ?? 'Nom inconnu', 
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    user.email??'Email inconnu',
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ChartPage()),
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
                                Icons.shopping_bag,
                                color: Colors.black,
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
            ),
            SizedBox(height: 10),
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
    ),SizedBox(height: 20),
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
    )
  ;}
}