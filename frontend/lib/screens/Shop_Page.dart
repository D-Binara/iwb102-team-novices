import 'package:flutter/material.dart';

import '../components/SearchBar.dart'; // Make sure this component is correctly implemented

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
        backgroundColor: Colors.white, // Adjust color if needed
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            CustomSearchBar(), // Include the SearchBar widget

            const SizedBox(height: 16), // Spacing

            // Expanded List of Items
            Expanded(
              child: ListView(
                children: [
                  ShopItemCard(
                    image: 'assets/Landing/onboarding_1.png', // Replace with your image path
                    title: 'Mango',
                    location: 'Deniyaya',
                    price: '6 USD',
                  ),
                  const SizedBox(height: 16), // Spacing between cards
                  ShopItemCard(
                    image: 'assets/Landing/onboarding_1.png', // Replace with your image path
                    title: 'Banana',
                    location: 'Horana',
                    price: '4 USD',
                  ),
                  const SizedBox(height: 16), // Spacing between cards
                  ShopItemCard(
                    image: 'assets/Landing/onboarding_1.png', // Replace with your image path
                    title: 'Apples',
                    location: 'Colombo',
                    price: '10 USD',
                  ),
                  const SizedBox(height: 16), // Spacing between cards
                  ShopItemCard(
                    image: 'assets/Landing/onboarding_1.png', // Replace with your image path
                    title: 'Tomatoes',
                    location: 'Siripura',
                    price: '1 USD',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green, // Button color
        onPressed: () {
          // Add action for the floating button
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class ShopItemCard extends StatelessWidget {
  final String image;
  final String title;
  final String location;
  final String price;

  const ShopItemCard({
    Key? key,
    required this.image,
    required this.title,
    required this.location,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
              child: Image.asset(
                image,
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
                      color: Colors.black, // Change text color to white for better contrast
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    location,
                    style: const TextStyle(color: Colors.grey), // Slightly lighter for location
                  ),
                  const SizedBox(height: 4),
                  Text(
                    price,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Change text color to white for better contrast
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
                backgroundColor: Colors.green, // Button color
              ),
              child: const Text(
                'BUY',
                style: TextStyle(
                  color: Colors.white, // Set text color to white
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
