import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final Function(String) onSearch; // Callback for search

  const CustomSearchBar({Key? key, required this.onSearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300], // Background color
        borderRadius: BorderRadius.circular(20), // Rounded corners
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        onChanged: onSearch, // Call the onSearch function with the query
        decoration: InputDecoration(
          hintText: 'Search items...',
          border: InputBorder.none,
          suffixIcon: const Icon(Icons.search), // Search icon
        ),
      ),
    );
  }
}
