import 'package:flutter/material.dart';
import 'package:frontend/screens/Profile/Add_Post.dart';
import 'package:frontend/screens/Profile/Profile_Details.dart';

import '../components/NavBar.dart';


class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align buttons to the left
          children: [
            // Top Section: Single Circle Centered
            // Top Section: Single Circle Centered
            Center(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.green, width: 2), // Add border with width 2
                ),
                child: CircleAvatar(
                  radius: 80, // Circle size
                  backgroundColor: Colors.green[200], // Circle color
                  child: const Text(
                    'Profile', // Example text inside the circle
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Centering the Profile Details Text
            const Center(
              child: Text(
                "Profile Details",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),

            // Column of Buttons (with icons aligned to the left)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align buttons to the left
              children: [
                // Button 1: Profile
                TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ProfileDetails()),
                    );                  },
                  icon: const Icon(Icons.person), // Icon on the left side
                  label: const Text(
                    "Profile",
                    style: TextStyle(fontSize: 18),
                  ),
                  style: TextButton.styleFrom(
                    alignment: Alignment.centerLeft, // Align text and icon to the left
                  ),
                ),
                const SizedBox(height: 10), // Space between buttons

                // Button 2: Lak
                TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AddPost()),
                    );
                  },
                  icon: const Icon(Icons.post_add_rounded), // Icon on the left side
                  label: const Text(
                    "Your Post",
                    style: TextStyle(fontSize: 18),
                  ),
                  style: TextButton.styleFrom(
                    alignment: Alignment.centerLeft, // Align text and icon to the left
                  ),
                ),
                const SizedBox(height: 10), // Space between buttons

                // Button 3: Hello
                TextButton.icon(
                  onPressed: () {

                  },
                  icon: const Icon(Icons.settings), // Icon on the left side
                  label: const Text(
                    "Setting",
                    style: TextStyle(fontSize: 18),
                  ),
                  style: TextButton.styleFrom(
                    alignment: Alignment.centerLeft, // Align text and icon to the left
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
        bottomNavigationBar: const NavBar(), // Add the NavBar here

    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Profile(),
  ));
}
