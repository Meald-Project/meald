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

  @override
  void initState() {
    super.initState();
    _pages.addAll([
      HomeScreen(),
      ProfilePage(),
      FavorisPage(),
      ChartPage(),
    ]);
  }

  final List<Widget> _pages = [];

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
                                    user.name ?? 'Nom inconnu', // Display actual username
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    user.email??'Email inconnu', // Display actual email
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
                      Text(
                        'Bonjour',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Commandez tous les produits bio dont vous avez besoin ici',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 150,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 150,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              height: 200,
              color: Colors.amber,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
                items: [
                  'https://cdn.pixabay.com/photo/2021/03/22/12/10/woman-6113940_1280.jpg',
                  'https://cdn.pixabay.com/photo/2017/09/04/18/51/vegetables-2715740_1280.jpg',
                  'https://cdn.pixabay.com/photo/2015/03/26/09/54/vegetables-690022_1280.jpg'
                ].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                        ),
                        child: Image.network(
                          i,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


