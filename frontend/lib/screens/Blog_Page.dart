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
                  imageUrl: 'assets/Blog/ceylon_tea.jpg',
                  title: 'Ceylon Tea Prices Surge Amid Global Demand',
                  views: '4200 views',
                ),
                MostViewedItem(
                  imageUrl: 'assets/Blog/sri_lanka_rice.jpg',
                  title: 'Sri Lanka Rice Prices Stabilize After Harvest Season',
                  views: '3500 views',
                ),
                MostViewedItem(
                  imageUrl: 'assets/Blog/pepper.jpg',
                  title: 'Sri Lankan Spices: Pepper and Cinnamon Prices',
                  views: '2900 views',
                ),
                MostViewedItem(
                  imageUrl: 'assets/Blog/vegetables.jpg',
                  title: 'Vegetable Prices Drop After Local Supply Increase',
                  views: '3100 views',
                ),
                MostViewedItem(
                  imageUrl: 'assets/Blog/mango.jpg',
                  title: 'Fruit Exports: Mango and Banana Prices Surge',
                  views: '2700 views',
                ),
                // Add more MostViewedItem widgets as needed
              ],
            ),
          ),
          SizedBox(height: 10), // Add some spacing

          // Blog card list
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              children: <Widget>[
                BlogCard(
                  imageUrl: 'assets/Blog/ceylon_tea.jpg',
                  title: 'Ceylon Tea Export Prices Hit Record Highs',
                  price: 'LKR 1,200/kg',
                  date: 'Oct 8, 2024',
                  views: '4200 views',
                ),
                BlogCard(
                  imageUrl: 'assets/Blog/sri_lanka_rice.jpg',
                  title: 'Local Rice Prices Steady Amid Strong Harvest',
                  price: 'LKR 110/kg',
                  date: 'Oct 7, 2024',
                  views: '3500 views',
                ),
                BlogCard(
                  imageUrl: 'assets/Blog/pepper.jpg',
                  title: 'Pepper and Cinnamon Prices Rise in 2024',
                  price: 'LKR 950/kg',
                  date: 'Oct 6, 2024',
                  views: '2900 views',
                ),
                BlogCard(
                  imageUrl: 'assets/Blog/cinnamon.jpg',
                  title: 'Cinnamon Prices in Sri Lanka Continue to Soar',
                  price: 'LKR 3,500/kg',
                  date: 'Oct 7, 2024',
                  views: '3200 views',
                ),
                BlogCard(
                  imageUrl: 'assets/Blog/fish.jpg',
                  title: 'Fresh Tuna Prices Decline After Increase in Supply',
                  price: 'LKR 1500/kg',
                  date: 'Oct 8, 2024',
                  views: '2500 views',
                ),
                BlogCard(
                  imageUrl: 'assets/Blog/tomato.jpg',
                  title: 'Tomato Prices Fall Due to High Yield',
                  price: 'LKR 90/kg',
                  date: 'Oct 9, 2024',
                  views: '3100 views',
                ),
                BlogCard(
                  imageUrl: 'assets/Blog/carrot.jpg',
                  title: 'Carrot Prices Fall Due to High Yield',
                  price: 'LKR 90/kg',
                  date: 'Oct 9, 2024',
                  views: '3100 views',
                ),
                BlogCard(
                  imageUrl: 'assets/Blog/mango.jpg',
                  title: 'Mango Exports Reach Record Prices in 2024',
                  price: 'LKR 200/kg',
                  date: 'Oct 10, 2024',
                  views: '2700 views',
                ),
                BlogCard(
                  imageUrl: 'assets/Blog/corn.jpg',
                  title: 'Corn Prices Stable Amid Steady Domestic Demand',
                  price: 'LKR 120/kg',
                  date: 'Oct 10, 2024',
                  views: '2800 views',
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
  final String price; // New field for the price
  final String date;
  final String views;

  BlogCard({
    required this.imageUrl,
    required this.title,
    required this.price,
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
                  Text(
                    price, // Display the price here
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
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
