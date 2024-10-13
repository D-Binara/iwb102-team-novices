import 'package:flutter/material.dart';

class AllPost extends StatelessWidget {
  const AllPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Products'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, // Use 1 to create a list-like grid
            mainAxisSpacing: 10.0,
            childAspectRatio: 3.0, // Adjust this for aspect ratio
          ),
          itemCount: productData.length,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                side: BorderSide(color: Colors.grey.shade300, width: 1.0),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        productData[index]['imageUrl'], // Load assets properly
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            productData[index]['title'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(productData[index]['location']),
                          const SizedBox(height: 5),
                          Text(
                            '${productData[index]['price']} Tsh',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Add functionality for "Buy"
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Text('BUY',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

final List<Map<String, dynamic>> productData = [
  {
    'title': 'Mango',
    'location': 'Deniyaya',
    'price': '6 USD',
    'imageUrl': 'assets/Landing/onboarding_1.png', // Correct asset path
  },
  {
    'title': 'Banana',
    'location': 'Horana',
    'price': '4 USD',
    'imageUrl': 'assets/Landing/onboarding_1.png',
  },
  {
    'title': 'Apples',
    'location': 'Colombo',
    'price': '10 USD',
    'imageUrl': 'assets/Landing/onboarding_1.png',
  },
];
