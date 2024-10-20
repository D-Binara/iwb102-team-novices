import 'package:flutter/material.dart';
import 'package:frontend/screens/LogIn_Page.dart';
import 'package:frontend/screens/Profile/Add_Post.dart';
import 'package:frontend/screens/Profile/Profile_Details.dart';
import 'package:frontend/screens/Profile/Setting.dart';
import 'package:frontend/services/auth_provider.dart';
import 'package:provider/provider.dart';
import '../components/NavBar.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Profile"),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.green, width: 2),
                ),
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.green[200],
                  child: Text(
                    authProvider.firstname ?? 'Profile',
                    style: const TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                "${authProvider.firstname ?? ''} ${authProvider.lastname ?? ''}",
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextButton(context, "Profile", Icons.person, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProfileDetails()),
                  );
                }),
                const SizedBox(height: 10),
                _buildTextButton(context, "Your Post", Icons.post_add_rounded, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AddPost()),
                  );
                }),
                const SizedBox(height: 10),
                _buildTextButton(context, "Setting", Icons.settings, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Setting()),
                  );
                }),
                const SizedBox(height: 10),
                _buildTextButton(context, "Log Out", Icons.logout, () {
                  _showLogOutConfirmationDialog(context);
                }, color: Colors.red),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const NavBar(),
    );
  }

  // Helper function to build a text button with icon and arrow
  Widget _buildTextButton(BuildContext context, String label, IconData icon, VoidCallback onPressed, {Color? color}) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: color ?? Colors.black),
      label: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 18, color: color ?? Colors.black),
          ),
          Icon(Icons.arrow_forward_ios, size: 16, color: color ?? Colors.black),
        ],
      ),
      style: TextButton.styleFrom(
        alignment: Alignment.centerLeft,
      ),
    );
  }

  void _showLogOutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Log Out'),
          content: const Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                'Log Out',
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
              onPressed: () {
                Provider.of<AuthProvider>(context, listen: false).logout();
                Navigator.of(context).pop(); 
                 Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LogInPage()),
                  );
              },
            ),
          ],
        );
      },
    );
  }
}
