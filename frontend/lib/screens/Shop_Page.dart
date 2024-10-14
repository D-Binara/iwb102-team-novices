import 'package:flutter/material.dart';
import 'package:frontend/screens/Profile/Add_Post.dart';
import '../components/NavBar.dart';
import '../components/SearchBar.dart'; // Ensure this component is correctly implemented
import 'item_detail.dart'; // Import the item detail page

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // Dismiss the keyboard on tap
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Shop'),
          backgroundColor: Colors.green,
          foregroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              CustomSearchBar(), // Include the SearchBar widget

              const SizedBox(height: 16), // Spacing

              // Expanded List of Items
              Expanded(
                child: ListView(
                  children: const [
                    ShopItemCard(
                      images: [
                        'assets/Landing/onboarding_1.png',
                        'assets/Landing/mango_2.png',
                        'assets/Landing/mango_3.png',
                      ],
                      title: 'Mango',
                      location: 'Deniyaya',
                      price: '6 USD',
                      description: 'Fresh and juicy mangoes from Deniyaya.', // Description added
                    ),
                    SizedBox(height: 16),
                    ShopItemCard(
                      images: [
                        'assets/Landing/onboarding_1.png',
                        'assets/Landing/banana_2.png',
                        'assets/Landing/banana_3.png',
                      ],
                      title: 'Banana',
                      location: 'Horana',
                      price: '4 USD',
                      description: 'Ripe bananas, perfect for smoothies.', // Description added
                    ),
                    SizedBox(height: 16),
                    ShopItemCard(
                      images: [
                        'assets/Auth/google.png',
                        'assets/Landing/apple_2.png',
                        'assets/Auth/google.png',
                      ],
                      title: 'Apples',
                      location: 'Colombo',
                      price: '10 USD',
                      description: 'Crisp and delicious apples, perfect for snacking.', // Description added
                    ),
                    SizedBox(height: 16),
                    ShopItemCard(
                      images: [
                        'assets/Landing/onboarding_1.png',
                        'assets/Landing/tomato_2.png',
                        'assets/Landing/tomato_3.png',
                      ],
                      title: 'Tomatoes',
                      location: 'Siripura',
                      price: '1 USD',
                      description: 'Organic tomatoes, great for salads.', // Description added
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddPost()),
            );
          },
          child: const Icon(Icons.add, color: Colors.white),
        ),
        bottomNavigationBar: const NavBar(),
      ),
    );
  }
}

class ShopItemCard extends StatelessWidget {
  final List<String> images; // Change to List<String> to hold multiple images
  final String title;
  final String location;
  final String price;
  final String description; // Add a description property

  const ShopItemCard({
    super.key,
    required this.images,
    required this.title,
    required this.location,
    required this.price,
    required this.description, // Update constructor to accept description
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
              images: images, // Pass the list of images to the ItemDetailPage
              description: description, // Pass the description to the ItemDetailPage
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
                child: Image.asset(
                  images[0], // Display the first image as the card image
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
                    ),
                    const SizedBox(height: 4),
                    Text(
                      location,
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