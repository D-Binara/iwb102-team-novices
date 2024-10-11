import 'package:flutter/material.dart';

import '../screens/Blog_Page.dart';
import '../screens/Home_Page.dart';
import '../screens/Shop_Page.dart';
import '../screens/Profile_Page.dart'; // Import the ProfilePage

class NabBar extends StatefulWidget {
  const NabBar({super.key});

  @override
  _NabBarState createState() => _NabBarState();
}

class _NabBarState extends State<NabBar> {
  int _selectedIndex = 0;

  // List of pages to navigate to, including the ProfilePage
  final List<Widget> _pages = [
    HomePage(), // Replace with your HomePage widget
    ShopPage(), // Replace with your ShopPage widget
    BlogPage(), // Replace with your BlogPage widget
     // Add the ProfilePage here
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index when tapped
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Fixed to allow more than 3 items
        currentIndex: _selectedIndex, // Set the current index
        onTap: _onItemTapped, // Handle taps on the navigation bar
        selectedItemColor: Colors.green, // Customize selected icon color
        unselectedItemColor: Colors.grey, // Customize unselected icon color
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // Home icon
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store), // Shop icon
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article), // Blog icon
            label: 'Blog',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person), // Profile icon
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}