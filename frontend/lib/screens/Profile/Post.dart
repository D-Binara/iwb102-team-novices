import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  String? selectedCategory; // To hold the selected category

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // Hide the keyboard when tapping outside
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text("Post"),
          elevation: 0,
          actions: [
            TextButton(
              onPressed: () {
                // Handle the "See All Post" button action here
                // For example, navigate to another page
                print("See All Post tapped");
              },
              child: const Text(
                "See All Post",
                style: TextStyle(
                  color: Colors.white, // Text color
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView( // Wrap the body with SingleChildScrollView
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
                        const Expanded(
                          child: Center(
                            child: Icon(
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

              const SizedBox(height: 20), // Space below the grid

              // Form fields with green border and red label on focus
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Product name',
                  labelStyle: TextStyle(color: Colors.grey), // Default label color
                  floatingLabelStyle: TextStyle(color: Colors.black), // Label color when focused
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green, // Green border color when focused
                      width: 2.0, // Border width
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, // Adjust vertical padding for height
                    horizontal: 20.0, // Adjust horizontal padding for width
                  ),
                ),
              ),
              const SizedBox(height: 10), // Space between fields

              // Dropdown for Category selection
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Category',
                  labelStyle: TextStyle(color: Colors.grey), // Default label color
                  floatingLabelStyle: TextStyle(color: Colors.black), // Label color when focused
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green, // Green border color when focused
                      width: 2.0, // Border width
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, // Adjust vertical padding for height
                    horizontal: 20.0, // Adjust horizontal padding for width
                  ),
                ),
                value: selectedCategory, // The currently selected value
                items: const [
                  DropdownMenuItem(
                    value: 'Vegetable',
                    child: Text('Vegetable'),
                  ),
                  DropdownMenuItem(
                    value: 'Fruits',
                    child: Text('Fruits'),
                  ),
                  DropdownMenuItem(
                    value: 'Other',
                    child: Text('Other'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedCategory = value; // Update the selected category
                  });
                },
              ),
              const SizedBox(height: 10), // Space between fields

              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Location',
                  labelStyle: TextStyle(color: Colors.grey), // Default label color
                  floatingLabelStyle: TextStyle(color: Colors.black), // Label color when focused
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green, // Green border color when focused
                      width: 2.0, // Border width
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, // Adjust vertical padding for height
                    horizontal: 20.0, // Adjust horizontal padding for width
                  ),
                ),
              ),
              const SizedBox(height: 10), // Space between fields

              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Product details',
                  labelStyle: TextStyle(color: Colors.grey), // Default label color
                  floatingLabelStyle: TextStyle(color: Colors.black), // Label color when focused
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green, // Green border color when focused
                      width: 2.0, // Border width
                    ),
                  ),
                ),
                maxLines: 3, // Allow for multiple lines
              ),
              const SizedBox(height: 10), // Space between fields

              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Price',
                  labelStyle: TextStyle(color: Colors.grey), // Default label color
                  floatingLabelStyle: TextStyle(color: Colors.black), // Label color when focused
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green, // Green border color when focused
                      width: 2.0, // Border width
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, // Adjust vertical padding for height
                    horizontal: 20.0, // Adjust horizontal padding for width
                  ),
                ),
              ),

              const SizedBox(height: 20), // Space before the button

              // Centering the Submit button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle the submit action here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Button color
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 100), // Button padding
                  ),
                  child: const Text(
                    'POST',
                    style: TextStyle(color: Colors.white), // Button text color
                  ),
                ),
              ),
            ],
          ),
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
