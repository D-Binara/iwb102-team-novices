import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/components/NavBar.dart';
import 'package:frontend/services/get_item_service.dart';
import 'item_detail.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
    late Future<List<Item>> _futureItems; // Future to hold the items
    late Future<List<String>> _futureImages; // Future to hold the images

    @override
    void initState() {
        super.initState();
        // Fetch items from the API when the widget is initialized
        _futureItems = GetItemService().fetchItems();
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Shop'),
                backgroundColor: Colors.green,
                foregroundColor: Colors.black,
            ),
            body: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                    children: [
                        const SizedBox(height: 16), // Spacing

                        // FutureBuilder to handle the API call and display the items
                        Expanded(
                            child: FutureBuilder<List<Item>>(
                                future: _futureItems,
                                builder: (context, snapshot) {
                                    if (snapshot.connectionState == ConnectionState.waiting) {
                                        // Show loading indicator while waiting for data
                                        return const Center(child: CircularProgressIndicator());
                                    } else if (snapshot.hasError) {
                                        // Show error message if something went wrong
                                        return Center(child: Text('Error: ${snapshot.error}'));
                                    } else if (snapshot.hasData && snapshot.data!.isEmpty) {
                                        // Show a message if no data is available
                                        return const Center(child: Text('No items available'));
                                    } else if (snapshot.hasData) {
                                        // Display the list of items
                                        final items = snapshot.data!;
                                        // Fetch images for the items
                                        _futureImages = GetItemService().fetchImages(
                                            items.map((item) => item.itemId).toList(),
                                        );

                                        return FutureBuilder<List<String>>(
                                            future: _futureImages,
                                            builder: (context, imageSnapshot) {
                                                if (imageSnapshot.connectionState == ConnectionState.waiting) {
                                                    return const Center(child: CircularProgressIndicator());
                                                } else if (imageSnapshot.hasError) {
                                                    return Center(child: Text('Error fetching images: ${imageSnapshot.error}'));
                                                } else if (imageSnapshot.hasData) {
                                                    final images = imageSnapshot.data!;
                                                    return ListView.builder(
                                                        itemCount: items.length,
                                                        itemBuilder: (context, index) {
                                                            final item = items[index];
                                                            return Column(
                                                                children: [
                                                                    ShopItemCard(
                                                                        images: [
                                                                            images[index]
                                                                        ], // Use the fetched image
                                                                        title: item.itemName,
                                                                        location: item.location,
                                                                        price: '${item.itemPrice} USD',
                                                                        description: item.details, // Use the details from API
                                                                    ),
                                                                    const SizedBox(height: 16),
                                                                ],
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
                    ],
                ),
            ),
            bottomNavigationBar: const NavBar(), // Add the NavBar here
        );
    }
}

class ShopItemCard extends StatelessWidget {
  final List<String> images; // List of base64 image strings
  final String title;
  final String location;
  final String price;
  final String description;

  const ShopItemCard({
    super.key,
    required this.images,
    required this.title,
    required this.location,
    required this.price,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemDetailPage(
              title: title,
              location: location,
              price: price,
              images: images,
              description: description,
            ),
          ),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: images.isNotEmpty && images[0].isNotEmpty
                    ? Image.memory(
                        base64Decode(images[0].split(',').last), // Decode the base64 string
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            'assets/placeholder.png',
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          );
                        },
                      )
                    : Image.asset(
                        'assets/Blog/corn.jpg',
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      location.isNotEmpty ? location : 'No location provided',
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      price,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Add action for 'BUY' button
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: const Text(
                  'BUY',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
