import 'package:flutter/material.dart';
import '../components/SearchBar.dart';  // Import your CustomSearchBar widget
import '../components/NavBar.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: const Text("Blog Page", style: TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.black), // Ensures back button is visible if needed
      ),
      body: Column(
        children: <Widget>[
          // Search bar at the top
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomSearchBar(), // Add your CustomSearchBar here
          ),
          // Most viewed items row
          Container(
            height: 168, // Fixed height to avoid conflicts
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              children: <Widget>[
                MostViewedItem(
                  imageUrl: 'assets/Blog/corn.jpg',
                  title: 'Sri Lanka’s Tea Industry and Economic Growth',
                  views: '3344 views',
                ),
                MostViewedItem(
                  imageUrl: 'assets/Blog/mango.jpg',
                  title: 'Tourism: Boosting Sri Lanka’s Economy Post-COVID',
                  views: '9823 views',
                ),
                MostViewedItem(
                  imageUrl: 'assets/Blog/mango.jpg',
                  title: 'Tourism: Boosting Sri Lanka’s Economy Post-COVID',
                  views: '9823 views',
                ),
                MostViewedItem(
                  imageUrl: 'assets/Blog/mango.jpg',
                  title: 'Tourism: Boosting Sri Lanka’s Economy Post-COVID',
                  views: '9823 views',
                ),
                MostViewedItem(
                  imageUrl: 'assets/Blog/pepper.jpg',
                  title: 'Mkulima kijana aliyekuza pesa kwa miche ya miti',
                  views: '3344 views',
                ),
                // Add more MostViewedItem widgets as needed
              ],
            ),
          ),
          SizedBox(height: 10), // Add some spacing

          // Blog card list
          Expanded(  // Use Expanded to allow the ListView to take up the remaining space
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              children: <Widget>[
                BlogCard(
                  imageUrl: 'assets/Blog/corn.jpg',
                  title: 'Sheria ina uhusiano gani na kilimo?',
                  author: 'John Doe',
                  date: 'Jan 4, 2022',
                  views: '3344 views',
                ),
                BlogCard(
                  imageUrl: 'assets/Blog/mango.jpg',
                  title: 'Kwanini wakulima wabunifu ndio wanahitajika',
                  author: 'Jane Smith',
                  date: 'Jan 1, 2022',
                  views: '9823 views',
                ),
                BlogCard(
                  imageUrl: 'assets/Blog/pepper.jpg',
                  title: 'Mkulima kijana aliyekuza pesa kwa miche ya miti',
                  author: 'Alex Kumar',
                  date: 'Jan 4, 2022',
                  views: '3344 views',
                ),
                BlogCard(
                  imageUrl: 'assets/Blog/pepper.jpg',
                  title: 'Mkulima kijana aliyekuza pesa kwa miche ya miti',
                  author: 'Alex Kumar',
                  date: 'Jan 4, 2022',
                  views: '3344 views',
                ),
                BlogCard(
                  imageUrl: 'assets/Blog/pepper.jpg',
                  title: 'Mkulima kijana aliyekuza pesa kwa miche ya miti',
                  author: 'Alex Kumar',
                  date: 'Jan 4, 2022',
                  views: '3344 views',
                ),
                BlogCard(
                  imageUrl: 'assets/Blog/pepper.jpg',
                  title: 'Mkulima kijana aliyekuza pesa kwa miche ya miti',
                  author: 'Alex Kumar',
                  date: 'Jan 4, 2022',
                  views: '3344 views',
                ),
                BlogCard(
                  imageUrl: 'assets/Blog/pepper.jpg',
                  title: 'Mkulima kijana aliyekuza pesa kwa miche ya miti',
                  author: 'Alex Kumar',
                  date: 'Jan 4, 2022',
                  views: '3344 views',
                ),
                BlogCard(
                  imageUrl: 'assets/Blog/pepper.jpg',
                  title: 'Mkulima kijana aliyekuza pesa kwa miche ya miti',
                  author: 'Alex Kumar',
                  date: 'Jan 4, 2022',
                  views: '3344 views',
                ),
                BlogCard(
                  imageUrl: 'assets/Blog/pepper.jpg',
                  title: 'Mkulima kijana aliyekuza pesa kwa miche ya miti',
                  author: 'Alex Kumar',
                  date: 'Jan 4, 2022',
                  views: '3344 views',
                ),
                // Add more BlogCard widgets as needed
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}

class MostViewedItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String views;

  MostViewedItem({
    required this.imageUrl,
    required this.title,
    required this.views,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160, // Width for each item
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              imageUrl,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis, // Handle long text
          ),
          SizedBox(height: 3),
          Text(
            views,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Image on the left
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                imageUrl,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10),
            // Blog details on the right
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis, // Handle long text
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: <Widget>[
                      Text(
                        date,
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      Spacer(),
                      Text(
                        views,
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
