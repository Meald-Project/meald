import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  final List<Article> articles = [
    Article(
      nom: 'Restaurant Marhabe',
      price: 10.00,
      imageUrl: 'https://assets.afcdn.com/recipe/20160928/21224_w1024h1024c1cx2128cy1416.webp',
      description: '12/08/2024',
    ),
    Article(
      nom: 'Restaurant BestVoice',
      price: 15.00,
      imageUrl: 'https://c8.alamy.com/compfr/2j0c1cj/doubleburger-double-hamburger-menu-avec-frites-assiette-sans-boisson-2j0c1cj.jpg',
      description: '11/11/2024',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mon Historique'),
      ),
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return ChartItem(article: articles[index]);
        },
      ),
    );
  }
}

class Article {
  final String nom;
  final double price;
  final String imageUrl;
  final String description;

  Article({
    required this.nom,
    required this.price,
    required this.description,
    required this.imageUrl,
  });
}

class ChartItem extends StatelessWidget {
  final Article article;

  const ChartItem({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.only(left: 0), // Adjust if needed
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                image: DecorationImage(
                  image: NetworkImage(article.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.nom,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      _truncateDescription(article.description),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(article.price.toStringAsFixed(2)),
                        SizedBox(width: 10),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _truncateDescription(String description) {
    if (description.length <= 20) {
      return description;
    } else {
      return description.substring(0, 20) + '...';
    }
  }
}
