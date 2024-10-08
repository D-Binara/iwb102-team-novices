import 'package:flutter/material.dart';

class BlogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search in here',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none,
              ),
              fillColor: Colors.grey[200],
              filled: true,
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: <Widget>[
          BlogCard(
            imageUrl:
            'https://example.com/corn.jpg', // Replace with actual image link
            title: 'Vidokezo vya masoko ya mazao ya mahindi',
            author: 'Mason Eduard',
            date: 'Jan 3, 2022',
            views: '3344 views',
          ),
          BlogCard(
            imageUrl:
            'https://example.com/pepper.jpg', // Replace with actual image link
            title: 'Usafirishaji wa mazao unavyofanyika',
            author: 'Ayumi White',
            date: 'Jan 3, 2022',
            views: '3344 views',
          ),
          // Add more BlogCard widgets as needed
        ],
      ),
    );
  }
}

class BlogCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String author;
  final String date;
  final String views;

  BlogCard({
    required this.imageUrl,
    required this.title,
    required this.author,
    required this.date,
    required this.views,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(imageUrl, fit: BoxFit.cover), // Display image
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: <Widget>[
                Text('By: $author'),
                Spacer(),
                Text(date),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(views),
          ),
        ],
      ),
    );
  }
}
