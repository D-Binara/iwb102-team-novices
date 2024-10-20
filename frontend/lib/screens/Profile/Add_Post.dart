import 'package:flutter/material.dart';
import 'package:frontend/components/NavBar.dart';
import 'package:frontend/screens/Profile/Your_Post.dart';
import 'package:frontend/services/item_service.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  List<File?> images = [null, null, null]; // List to hold image files
  final ImagePicker _picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();

  // Controllers for form fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  String? selectedCategory;

  final ItemService apiService = ItemService(dotenv.env['BASE_URL']!);

  // Pick image from gallery
  Future<void> _pickImage(int index) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        images[index] = File(pickedFile.path);
      });
    }
  }

  // Submit form data to items/add endpoint
  Future<void> _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      String name = _nameController.text;
      String location = _locationController.text;
      String details = _detailsController.text;
      String price = _priceController.text;
      String category = selectedCategory ?? '';

      // Send data to items/add endpoint
      int? itemId = await apiService.addItem(
        itemName: name,
        itemQuantity: '1', // Example hardcoded value
        itemPrice: price,
        itemCategory: category,
        location: location,
        details: details,
      );

      if (itemId != null) {
        // If data is successfully added, upload images
        for (var image in images) {
          if (image != null) {
            bool success = await apiService.uploadImage(image, itemId);
            if (!success) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Failed to upload an image')),
              );
            }
          }
        }

        // Show success message
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Center(
                child: Text(
                  'Add Successful',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 25),
                ),
              ),
              content: SizedBox(
                width: MediaQuery.of(context).size.width *
                    0.5, // 50% of screen width
                height: MediaQuery.of(context).size.height *
                    0.03, // 10% of screen height
                child: const Center(
                  child: Text(
                    'Thank you for your Post',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              actions: [
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddPost()),
                      );
                    },
                    child: const Text(
                      'OK',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      } else {
        // Handle error
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to add post')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context)
            .unfocus(); // Hide the keyboard when tapping outside
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text("Post"),
          elevation: 0,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const YourPost()),
                );
              },
              child: const Text(
                "Your Post",
                style: TextStyle(
                  color: Colors.white, // Text color
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
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
                          _showBottomSheet(context, index);
                        } else {
                          _pickImage(index);
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green, width: 2),
                          borderRadius: BorderRadius.circular(8),
                          color:
                              images[index] == null ? Colors.green[200] : null,
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
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    labelText: 'Product name',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      // Green border when focused
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter product name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    labelText: 'Category',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      // Green border when focused
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                  value: selectedCategory,
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
                      value: 'Grains',
                      child: Text('Grains'),
                    ),
                    DropdownMenuItem(
                      value: 'spices',
                      child: Text('spices'),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedCategory = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a category';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _locationController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    labelText: 'Location',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      // Green border when focused
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter location';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _detailsController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Product details',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      // Green border when focused
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter product details';
                    }
                    return null;
                  },
                  maxLines: 3,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _priceController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    labelText: 'Price (USD)',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      // Green border when focused
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter price';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, // Button color
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 100), // Button padding
                    ),
                    child: const Text(
                      'Post',
                      style: TextStyle(
                          color: Colors.white), // Set text color to white
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: const NavBar(),
      ),
    );
  }

  // Show bottom sheet for image options
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
                  _viewImageFullScreen(index);
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Remove Image'),
                onTap: () {
                  Navigator.pop(context);
                  _removeImage(index);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Remove image
  void _removeImage(int index) {
    setState(() {
      images[index] = null;
    });
  }

  // View image in full screen
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
}

void main() {
  runApp(const MaterialApp(
    home: AddPost(),
  ));
}
