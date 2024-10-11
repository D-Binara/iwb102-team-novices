import 'package:flutter/material.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key});

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
                    CircleAvatar(
                      radius: 80, // Circle size
                      backgroundColor: Colors.green[200], // Circle color
                      child: const Text(
                        'Profile', // Example text inside the circle
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                    // Camera Icon Button
                    IconButton(
                      padding: const EdgeInsets.all(5.0), // Padding around the icon
                      onPressed: () {
                        // Handle camera button press here
                      },
                      icon: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xB4B4AFFF), // Background color for the icon
                        ),
                        child: const Icon(
                          Icons.camera_alt, // Camera icon
                          color: Colors.green, // Icon color
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
