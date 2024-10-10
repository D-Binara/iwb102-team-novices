import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  const Post({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Post"),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding to the body
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align items to the start
          children: [
            const Text(
              "Add Images",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), // Style of the text
            ),
            const SizedBox(height: 20), // Space below the text

            // Grid of images
            GridView.count(
              shrinkWrap: true, // Allow the grid to occupy only the necessary space
              physics: const NeverScrollableScrollPhysics(), // Disable scrolling
              crossAxisCount: 3, // Number of columns in the grid
              childAspectRatio: 0.8, // Aspect ratio for grid items
              mainAxisSpacing: 10.0, // Space between rows
              crossAxisSpacing: 10.0, // Space between columns
              children: List.generate(3, (index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.green[200], // Background color
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center, // Center the contents
                    children: [
                      Expanded(
                        child: Center(
                          child: const Icon(
                            Icons.add_box_rounded, // Placeholder icon for image
                            color: Colors.white,
                            size: 50, // Icon size
                          ),
                        ),
                      ),
                      // Text below the image/icon
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0), // Space below the text
                        child: Text(
                          'Image ${index + 1}', // Image text
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Post(),
  ));
}
