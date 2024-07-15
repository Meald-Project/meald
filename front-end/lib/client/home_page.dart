import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart'; // Import carousel_slider package

class HomePageClient extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<HomePageClient> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePageR()), // Create MaterialPageRoute here
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/Logo.gif', // Use Image.asset for local assets
          height: 130,
          width: 130,
        ),
      ),
    );
  }
}

class HomePageR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Left Section
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Handle slider icon click
                                // Show slider content
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 164, 165, 165),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                  size: 30,
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
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'assem@gmail.com',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Right Section
                        GestureDetector(
                          onTap: () {
                            // Handle cart icon click
                            // Navigate to cart page or show cart content
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 2, 1, 49),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Icon(
                              Icons.shopping_bag,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    // Additional Widgets and Content
                  ],
                ),
              ),
            ),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Fixed Title
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 24,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Featured Carousel',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () {
                            // Handle "see more" button press
                          },
                          child: Text(
                            'See more',
                            style: TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    // CarouselSlider
                    CarouselSlider(
                      items: [
                        _carouselItem(
                          imageUrl: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.rvSWtRd_oPRTwDoTCmkP5gAAAA%26pid%3DApi&f=1&ipt=4eff9a5d7d22249208e9472e985283aee53c7c785e9265810c51f0f39de585bc&ipo=images",
                          title: 'Beach Paradise',
                          subtitle: 'Relax and enjoy the view',
                        ),
                        _carouselItem(
                          imageUrl: "http://allpicts.in/wp-content/uploads/2018/03/Natural-Images-HD-1080p-Download-with-Keyhole-Arch-at-Pfeiffer-Beach.jpg",
                          title: 'Scenic Arch',
                          subtitle: 'Nature’s beauty at its finest',
                        ),
                        _carouselItem(
                          imageUrl: "https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fwww.hdwallpaper.nu%2Fwp-content%2Fuploads%2F2015%2F09%2Ftropical_beach_blue_summer_sea_emerald_sand_hd-wallpaper-1701606.jpg&f=1&nofb=1&ipt=6eb95fc58404f4ef582fa656596438a8313acf27a78c036f2657e601cba7be53&ipo=images",
                          title: 'Tropical Beach',
                          subtitle: 'Feel the tropical breeze',
                        ),
                        _carouselItem(
                          imageUrl: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.OjNHJL6A-Lzw_jLJfFgtMwHaEK%26pid%3DApi&f=1&ipt=9f19fe8349e515790867030de18da3ba6f4cae0548d5195b66004453fb7916d0&ipo=images",
                          title: 'Majestic Sunset',
                          subtitle: 'A beautiful evening view',
                        ),
                        _carouselItem(
                          imageUrl: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.bircyBDvJOcKd3mkR6ramwHaEK%26pid%3DApi&f=1&ipt=5909f3cdfdc42fb7effd2baabc4312074c2866f899860a96cf501dc9d1f51cf4&ipo=images",
                          title: 'Mountain View',
                          subtitle: 'Explore the mountains',
                        ),
                      ],
                      options: CarouselOptions(
                        height: 250.0, // Increased height to accommodate title and subtitle
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction: 0.8,
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  // Helper widget to create carousel items with title and subtitle
  Widget _carouselItem({required String imageUrl, required String title, required String subtitle}) {
    return Container(
      margin: EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            color: Colors.black.withOpacity(0.5), // Dark overlay
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
