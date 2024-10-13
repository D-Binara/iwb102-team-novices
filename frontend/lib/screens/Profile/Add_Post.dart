import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:frontend/screens/Profile/All_Post.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  List<File?> images = [null, null, null]; // List to hold image files
  final ImagePicker _picker = ImagePicker();

  get selectedCategory => null;

  // Function to pick image from gallery
  Future<void> _pickImage(int index) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        images[index] = File(pickedFile.path); // Set the picked image to the selected grid item
      });
    }
  }

  // Function to show the bottom sheet
  void _showBottomSheet(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.remove_red_eye),
                title: const Text('View Image'),
                onTap: () {
                  Navigator.pop(context);
                  _viewImageFullScreen(index); // View image in full screen
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Remove Image'),
                onTap: () {
                  Navigator.pop(context);
                  _removeImage(index); // Remove image from the grid
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Function to remove image
  void _removeImage(int index) {
    setState(() {
      images[index] = null; // Set the image to null (remove it from grid)
    });
  }

  // Function to view image in full screen
  void _viewImageFullScreen(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Text("Full Image"),
          ),
          body: Center(
            child: Image.file(images[index]!),
          ),
        ),
      ),
    );
  }

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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AllPost()),
                );
                if (kDebugMode) {
                  print("See All Post tapped");
                }
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
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Add Images",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                childAspectRatio: 0.8,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                children: List.generate(3, (index) {
                  return GestureDetector(
                    onTap: () {
                      if (images[index] != null) {
                        _showBottomSheet(context, index); // Show bottom sheet if image exists
                      } else {
                        _pickImage(index); // Pick an image if no image is present
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green, width: 2), // Add border here
                        borderRadius: BorderRadius.circular(8),
                        color: images[index] == null ? Colors.green[200] : null,
                        image: images[index] != null
                            ? DecorationImage(
                          image: FileImage(images[index]!),
                          fit: BoxFit.cover,
                        )
                            : null,
                      ),
                      child: images[index] == null
                          ? const Center(
                        child: Icon(
                          Icons.add_box_rounded,
                          color: Colors.white,
                          size: 50,
                        ),
                      )
                          : null,
                    ),
                  );
                }),
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Product name',
                  labelStyle: TextStyle(color: Colors.grey),
                  floatingLabelStyle: TextStyle(color: Colors.black),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 2.0,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                ),
              ),
              const SizedBox(height: 10),
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
                  contentPadding: EdgeInsets.symmetric(
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
                  contentPadding: EdgeInsets.symmetric(
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
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10.0, // Adjust vertical padding for height
                    horizontal: 20.0, // Adjust horizontal padding for width
                  ),
                ),
              ),

              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle submit action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 100),
                  ),
                  child: const Text(
                    'POST',
                    style: TextStyle(color: Colors.white),
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
    home: AddPost(),
  ));
}
