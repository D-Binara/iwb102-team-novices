import 'package:flutter/material.dart';
import 'package:frontend/components/NavBar.dart';
import 'package:frontend/components/SearchBar.dart'; // Import the CustomSearchBar
import 'package:frontend/services/get_item_service.dart';
import 'item_detail.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  late Future<List<Item>> _futureItems; // Future to hold the items
  String _searchQuery = ''; // Variable to hold the search query
  List<Item> _allItems = []; // List to hold all items

  @override
  void initState() {
    super.initState();
    // Fetch items from the API when the widget is initialized
    _futureItems = GetItemService().fetchItems().then((items) {
      _allItems = items; // Store all items for filtering
      return items;
    });
  }

  void _updateSearchQuery(String query) {
    setState(() {
      _searchQuery = query; // Update the search query
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context)
              .unfocus(); // Hide the keyboard when tapping outside
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
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CustomSearchBar(onSearch: _updateSearchQuery), // Pass the search callback
                ),
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
                        // Filter items based on the search query
                        final items = _allItems.where((item) {
                          return item.itemName.toLowerCase().contains(_searchQuery.toLowerCase());
                        }).toList();

                        if (items.isEmpty) {
                          return const Center(child: Text('No matching items found'));
                        }

                        return ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            final item = items[index];
                            return Column(
                              children: [
                                ShopItemCard(
                                  images: [item.itemImage], // Use the item image from API
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
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: const NavBar(), // Add the NavBar here
        ),
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
                child: images.isNotEmpty && images[0].isNotEmpty
                    ? Image.network(
                  images[0],
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/Blog/corn.jpg',
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
