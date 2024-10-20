import 'package:flutter/material.dart';
import '../components/NavBar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [

              // Categories Section
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft, // This aligns the text to the left
                    child: Padding(
                      padding: EdgeInsets.only(left: 12.0), // Optional padding
                      child: Text(
                        'Shop by category',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )

                ],
              ),
              const SizedBox(height: 10),

              // Horizontal Scroll of Categories
            // Horizontal Scroll of Categories
            SizedBox(
              height: 140, // Increase height to ensure enough space for the icons and text
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CategoryIcon(
                    imageUrl: 'assets/Home/Category/vegetables.jpeg',
                    name: 'Vegetables',
                  ),
                  CategoryIcon(
                    imageUrl: 'assets/Home/Category/Fruits.jpeg',
                    name: 'Fruits',
                  ),
                  CategoryIcon(
                    imageUrl: 'assets/Home/Category/Seeds.jpeg',
                    name: 'Grains',
                  ),
                  CategoryIcon(
                    imageUrl: 'assets/Home/Category/spices.jpeg',
                    name: 'spices',
                  ),

                ],
              ),
            ),


              // Recommended Section
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Recommended',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              // Grid of Recommended Items
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: const [
                    RecommendedItem(
                      imageUrl: 'assets/Home/Recommended/Mango.jpeg',
                      title: 'Mango',
                      location: 'Deniyaya',
                      price: '6 USD',
                    ),
                    RecommendedItem(
                      imageUrl: 'assets/Home/Recommended/Tomato.jpeg',
                      title: 'Tomato',
                      location: 'Badulla',
                      price: '4 USD',
                    ),
                    RecommendedItem(
                      imageUrl: 'assets/Home/Recommended/Cinnamon.jpeg',
                      title: 'Cinnamon',
                      location: 'Kegalle',
                      price: '6 USD',
                    ),
                    RecommendedItem(
                      imageUrl: 'assets/Home/Recommended/Tea.jpeg',
                      title: 'Tea',
                      location: 'Lipton',
                      price: '3 USD',
                    ),
                    RecommendedItem(
                      imageUrl: 'assets/Home/Recommended/Pumpking.jpeg',
                      title: 'Pumpking',
                      location: 'Siripura',
                      price: '6 USD',
                    ),
                    RecommendedItem(
                      imageUrl: 'assets/Home/Recommended/Banana.jpeg',
                      title: 'Banana',
                      location: 'Horana',
                      price: '4 USD',
                    ),
                    RecommendedItem(
                      imageUrl: 'assets/Home/Recommended/Apples.jpeg',
                      title: 'Apples',
                      location: 'Colombo',
                      price: '10 USD',
                    ),
                    RecommendedItem(
                      imageUrl: 'assets/Home/Recommended/Carrot.jpeg',
                      title: 'Carrot',
                      location: 'Kandy',
                      price: '4 USD',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const NavBar(), // Add the NavBar here
      ),
    );
  }
}

class CategoryIcon extends StatelessWidget {
  final String imageUrl;
  final String name;

  const CategoryIcon({
    super.key,
    required this.imageUrl,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 5), // Add padding between items
      child: Column(
        children: [
          Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), // Rounded corners
              border: Border.all(
                  color: Colors.green, width: 2), // Green border around image
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover, // Fit the image to the container
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(name),
        ],
      ),
    );
  }
}

class RecommendedItem extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String location;
  final String price;

  const RecommendedItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.location,
    required this.price,
  });

  @override
  _RecommendedItemState createState() => _RecommendedItemState();
}

class _RecommendedItemState extends State<RecommendedItem> {
  bool _isFavorited = false; // State variable to track if the item is favorited

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1), // Shadow color
            spreadRadius: 1, // Adjust spread to create a border-like effect
            blurRadius: 5, // Softness of the shadow
            offset: const Offset(0, 0), // Keep it centered for a border effect
          ),
        ],
        border: Border.all(color: Colors.green), // Keep the original border
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  image: DecorationImage(
                    image: AssetImage(widget.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // Space between title and location
                  children: [
                    Expanded(
                      child: Text(
                        widget.title,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    // Location text aligned to the right of the title
                    Text(
                      widget.location,
                      style: const TextStyle(
                          color: Colors.grey), // Style for location
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8.0), // Add horizontal padding
                child: Text(
                  widget.price,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          // Heart Icon in a White Circle
          Positioned(
            top: 8, // Adjust the position as needed
            right: 8, // Adjust the position as needed
            child: GestureDetector(
              // Use GestureDetector to capture tap events
              onTap: () {
                setState(() {
                  _isFavorited = !_isFavorited; // Toggle favorite state
                });
              },
              child: Container(
                width: 30, // Set the width of the circle
                height: 30, // Set the height of the circle
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white, // Background color of the circle
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey
                          .withOpacity(0.5), // Shadow color for the circle
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Center(
                  // Center the heart icon within the circle
                  child: Icon(
                    _isFavorited
                        ? Icons.favorite
                        : Icons.favorite_border, // Toggle icon
                    color:
                        _isFavorited ? Colors.red : Colors.grey, // Toggle color
                    size: 16, // Adjust the size of the heart icon
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}