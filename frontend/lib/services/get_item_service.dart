import 'dart:convert'; // For JSON decoding
import 'package:http/http.dart' as http; // HTTP package to make requests

// Define a model to map the JSON response
class Item {
  final int itemId;
  final double itemPrice;
  final String itemImage;
  final String itemName;
  final String location;
  final String details;
  final int itemQuantity;
  final String itemCategory;

  Item({
    required this.itemId,
    required this.itemPrice,
    required this.itemImage,
    required this.itemName,
    required this.location,
    required this.details,
    required this.itemQuantity,
    required this.itemCategory,
  });

  // Factory constructor to create an Item from JSON
  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      itemId: json['item_id'],
      itemPrice: json['item_price'].toDouble(),
      itemImage: json['item_image'],
      itemName: json['item_name'],
      location: json['location'] ?? '',
      details: json['details'] ?? '',
      itemQuantity: json['item_quantity'],
      itemCategory: json['item_category'],
    );
  }
}

// API Service class to handle network requests
class GetItemService {
  final String baseUrl = 'http://192.168.8.186:8080'; // Replace with your backend URL

  // Fetch items from the backend
  Future<List<Item>> fetchItems() async {
    final response = await http.get(Uri.parse('$baseUrl/item/get'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      // Map each item in the response to the Item model
      return data.map((item) => Item.fromJson(item)).toList();
    } else {
      // Throw an error if the server did not return a 200 OK response
      throw Exception('Failed to load items');
    }
  }
}
