import 'package:flutter/material.dart';
import 'package:frontend/components/NavBar.dart';
import 'package:frontend/services/auth_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:provider/provider.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({super.key});

  @override
  _ProfileDetailsState createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  final _formKey = GlobalKey<FormState>(); // Form key to manage form state
  File? _image; // File to store the selected image
  bool _isPasswordVisible = false; // Visibility of the password

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // Set the image file
      });
    }
  }

  // Function to show the bottom popup menu
  void _showBottomSheet(BuildContext context) {
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
                  _viewImageFullScreen(); // View image in full screen
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Remove Image'),
                onTap: () {
                  Navigator.pop(context);
                  _removeImage(); // Remove image from the grid
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Function to view the image in full screen
  void _viewImageFullScreen() {
    if (_image != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: const Text("Full Image"),
            ),
            body: Center(
              child: Image.file(_image!),
            ),
          ),
        ),
      );
    }
  }

  // Function to remove the image from the grid
  void _removeImage() {
    setState(() {
      _image = null; // Set the image to null (remove it from the grid)
    });
  }

  @override
  Widget build(BuildContext context) {
    // Accessing AuthProvider to get user details
    final authProvider = Provider.of<AuthProvider>(context);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context)
            .unfocus(); // Hide the keyboard when tapping outside
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text("Profile Details"),
          elevation: 0,
        ),
        resizeToAvoidBottomInset:
            true, // Allows the body to resize when keyboard shows
        body: SingleChildScrollView(
          // Makes the page scrollable
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey, // Assign the form key to the form
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Centering the Circle Avatar at the top
                Center(
                  child: Stack(
                    alignment: Alignment
                        .bottomRight, // Align the icon at the bottom right
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Colors.green,
                              width: 2), // Add border with width 2
                        ),
                        child: CircleAvatar(
                          radius: 80, // Circle size
                          backgroundColor: Colors.green[200], // Circle color
                          backgroundImage: _image != null
                              ? FileImage(_image!)
                              : null, // Display selected image
                          child: _image == null
                              ? const Text(
                                  'Profile',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30),
                                )
                              : null,
                        ),
                      ),
                      // Camera Icon Button
                      IconButton(
                        padding: const EdgeInsets.all(5.0),
                        onPressed: _pickImage,
                        icon: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.black,
                            size: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  "Additional Information",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                Text(
                  'First Name: ${authProvider.firstname}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 20),
                Text(
                  'Last Name: ${authProvider.firstname}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 20),
                Text(
                  'Username: ${authProvider.firstname} ${authProvider.lastname}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 20),

                Text(
                  'Email: ${authProvider.email}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 20),

                // Update Button
                ElevatedButton(
                  onPressed: () {
                    // This can be used for any update logic
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Profile updated successfully!')),
                    );
                  }, // Call validation and submission
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Button color
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                    ),
                  ),
                  child: const Text(
                    "Update",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const NavBar(),
      ),
    );
  }
}
