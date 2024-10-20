import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/components/NavBar.dart';
import 'package:frontend/services/get_item_service.dart';
import 'item_detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Item>> _futureItems;
  late Future<List<String>> _futureImages;

  @override
  void initState() {
    super.initState();
    _futureItems = GetItemService().fetchItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(children: [
          // Categories Section
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment:
                    Alignment.centerLeft, // This aligns the text to the left
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

          SizedBox(
            height:
                140, // Increase height to ensure enough space for the icons and text
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
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Recommended',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),

          Expanded(
            child: FutureBuilder<List<Item>>(
              future: _futureItems,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData && snapshot.data!.isEmpty) {
                  return const Center(child: Text('No items available'));
                } else if (snapshot.hasData) {
                  final items = snapshot.data!;

                  _futureImages = GetItemService().fetchImages(
                    items.map((item) => item.itemId).toList(),
                  );

                  return FutureBuilder<List<String>>(
                    future: _futureImages,
                    builder: (context, imageSnapshot) {
                      if (imageSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (imageSnapshot.hasError) {
                        return Center(
                            child: Text(
                                'Error fetching images: ${imageSnapshot.error}'));
                      } else if (imageSnapshot.hasData) {
                        final images = imageSnapshot.data!;
                        return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // Two columns
                            crossAxisSpacing: 16.0, // Space between columns
                            mainAxisSpacing: 16.0, // Space between rows
                            childAspectRatio:
                                0.75, // Adjust height/width ratio as needed
                          ),
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            final item = items[index];
                            return ShopItemCard(
                              images: [images[index]],
                              title: item.itemName,
                              location: item.location,
                              price: '${item.itemPrice} USD',
                              description: item.details,
                            );
                          },
                        );
                      }
                      return const Center(child: Text('No data available'));
                    },
                  );
                }
                return const Center(child: Text('No data available'));
              },
            ),
          ),
        ]),
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}

class ShopItemCard extends StatelessWidget {
  final List<String> images;
  final String title;
  final String location;
  final String price;
  final String description;

  const ShopItemCard({
    Key? key,
    required this.images,
    required this.title,
    required this.location,
    required this.price,
    required this.description,
  }) : super(key: key);

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
        border: Border.all(color: Colors.green), // Border color
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Container
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                child: images.isNotEmpty && images[0].isNotEmpty
                    ? Image.memory(
                        base64Decode(images[0]
                            .split(',')
                            .last), // Decode the base64 string
                        height: 120,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            'assets/placeholder.png',
                            height: 120,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          );
                        },
                      )
                    : Image.asset(
                        'assets/Blog/corn.jpg',
                        height: 120,
                        width: double.infinity,
                        fit: BoxFit.cover,
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
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Location text aligned to the right of the title
                    Text(
                      location.isNotEmpty ? location : 'No location provided',
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
                  price,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          // Heart Icon in a White Circle
          Positioned(
            top: 8, // Adjust the position as needed
            right: 8, // Adjust the position as needed
            child: GestureDetector(
              onTap: () {
                // Add your favorite toggle logic here
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
                    Icons.favorite_border, // Default icon
                    color: Colors.grey, // Default color
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
