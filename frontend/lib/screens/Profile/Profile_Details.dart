import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({super.key});

  @override
  _ProfileDetailsState createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  File? _image; // File to store the selected image

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // Hide the keyboard when tapping outside
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text("Profile Details"),
          elevation: 0,
        ),
        resizeToAvoidBottomInset: true, // Allows the body to resize when keyboard shows
        body: SingleChildScrollView( // Makes the page scrollable
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Centering the Circle Avatar at the top
              Center(
                child: Stack(
                  alignment: Alignment.bottomRight, // Align the icon at the bottom right
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.green, width: 2), // Add border with width 2
                      ),
                      child: CircleAvatar(
                        radius: 80, // Circle size
                        backgroundColor: Colors.green[200], // Circle color
                        backgroundImage: _image != null ? FileImage(_image!) : null, // Display selected image
                        child: _image == null
                            ? const Text(
                          'Profile', // Example text inside the circle
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        )
                            : null, // Remove text when an image is selected
                      ),
                    ),
                    // Camera Icon Button
                    IconButton(
                      padding: const EdgeInsets.all(5.0), // Padding around the icon
                      onPressed: _pickImage, // Call image picker when pressed
                      icon: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xB4B4AFFF), // Background color for the icon
                        ),
                        child: const Icon(
                          Icons.camera_alt, // Camera icon
                          color: Colors.black, // Icon color
                          size: 25, // Icon size
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20), // Space below the circle

              // Additional Information Text
              const Text(
                "Additional Information",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30), // Space below the title

              // Form Fields
              TextField(
                decoration: InputDecoration(
                  labelText: "Username",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0), // Set the border radius
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0), // Adjust size by padding
                ),
              ),
              const SizedBox(height: 20), // Space between fields

              TextField(
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0), // Set the border radius
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0), // Adjust size by padding
                ),
              ),
              const SizedBox(height: 20), // Space between fields

              TextField(
                decoration: InputDecoration(
                  labelText: "Phone Number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0), // Set the border radius
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0), // Adjust size by padding
                ),
              ),
              const SizedBox(height: 20), // Space between fields

              TextField(
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0), // Set the border radius
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0), // Adjust size by padding
                ),
              ),
              const SizedBox(height: 20), // Space below the last field

              // Update Button
              ElevatedButton(
                onPressed: () {
                  // Handle the update button press
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Button color
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 100),
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
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: ProfileDetails(),
  ));
}
