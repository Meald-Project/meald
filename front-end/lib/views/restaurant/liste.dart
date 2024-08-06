import 'package:flutter/material.dart';
import 'footer.dart';

class Liste extends StatefulWidget {
  const Liste({Key? key}) : super(key: key);

  @override
  _ListeState createState() => _ListeState();
}

class _ListeState extends State<Liste> {
  String _selectedCategory = 'Tout';

  void _onCategoryTap(String category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ma Liste"),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildCategoryItem('Tout'),
                      _buildCategoryItem('Petit Déjeuner'),
                      _buildCategoryItem('Déjeuner'),
                      _buildCategoryItem('Diner'),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 2,
                        color: Colors.grey[300],
                        margin: EdgeInsets.only(top: 15),
                      ),
                      AnimatedPositioned(
                        duration: Duration(milliseconds: 300),
                        left: _selectedCategoryPosition(context),
                        top: 15,
                        child: Container(
                          height: 2,
                          width: MediaQuery.of(context).size.width / 4,
                          color: Color.fromARGB(255, 255, 70, 3),
                        ),
                      ),
                    ],
                  ),
                  _detailArticle(),
                  _detailArticle(),
                  _detailArticle(),
                ],
              ),
            ),
          ),
          Footer(), // Place the footer after the scrollable content
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String category) {
    bool isSelected = _selectedCategory == category;
    return GestureDetector(
      onTap: () => _onCategoryTap(category),
      child: Column(
        children: [
          Text(
            category,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isSelected ? Color.fromARGB(255, 255, 70, 3) : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _detailArticle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Container(
                width: 150,
                height: 120,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(240, 245, 250, 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.asset(
                      "assets/addpic.png",
                      width: 40,
                      height: 40,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Nom de l'article",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.more_horiz,
                          color: Colors.grey[600],
                          size: 30,
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromARGB(54, 255, 115, 63),
                          ),
                          child: Center(
                            child: Text(
                              "Categorie",
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 70, 3),
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        Text(
                          "\$19.99",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 70, 3),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: const [
                        Icon(
                          Icons.star,
                          color: Color.fromARGB(255, 255, 70, 3),
                          size: 18,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "4.9",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 255, 70, 3),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          '(10 notes)',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  double _selectedCategoryPosition(BuildContext context) {
    switch (_selectedCategory) {
      case 'Tout':
        return 0;
      case 'Petit Déjeuner':
        return MediaQuery.of(context).size.width / 4;
      case 'Déjeuner':
        return MediaQuery.of(context).size.width / 2;
      case 'Diner':
        return 3 * MediaQuery.of(context).size.width / 4;
      default:
        return 0;
    }
  }
}
