import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200], // Background color
        borderRadius: BorderRadius.circular(20), // Rounded corners
      ),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        decoration: InputDecoration(
          // Search icon
          hintText: 'Search in here',
          border: InputBorder.none,
          suffixIcon: const Icon(Icons.search),// Remove underline
        ),
      ),
    );
  }
}