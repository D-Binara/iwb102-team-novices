import 'package:flutter/material.dart';
import 'package:frontend/screens/Blog_Page.dart';
import 'package:frontend/screens/Home_Page.dart';
import 'package:frontend/screens/Profile_Page.dart';
import 'package:frontend/screens/Shop_Page.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  // Handle navigation when a tab is clicked
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });

    // Handle navigation based on the selected index
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ShopPage()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const BlogPage()),
        );
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Profile()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex, // Set the current index based on the state
      onTap: _onItemTapped,
      selectedItemColor: Colors.green, // Green color for selected items
      unselectedItemColor: Colors.black, // Black color for unselected items
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.store),
          label: 'Shop',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.article_outlined),
          label: 'Blog',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
