import 'package:flutter/material.dart';
import 'package:frontend/screens/Home_Page.dart';
import 'package:frontend/services/item_service.dart';
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
  final _formKey = GlobalKey<FormState>();

  // Controllers for form fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  String? selectedCategory;

  final ItemService apiService = ItemService(
      'http://192.168.8.186:8080'); // Update with actual backend URL

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
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Post added successfully!')),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
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
                    labelText: 'Product name',
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
                    labelText: 'Category',
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
                      value: 'Other',
                      child: Text('Other'),
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
                    labelText: 'Location',
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
                  ),
                  maxLines: 3,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _priceController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Price',
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
                ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
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
