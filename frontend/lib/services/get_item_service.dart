import 'dart:convert'; 
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

// Update Item class to hold image as byte array
class Item {
  final int itemId;
  final double itemPrice;
  String itemImage; // Change to String, but will hold base64 image or URL
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

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      itemId: json['item_id'],
      itemPrice: json['item_price'].toDouble(),
      itemImage: "", // Initially empty, we'll fill it later with fetched image
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
  final String? baseUrl = dotenv.env['BASE_URL'];

  // Fetch the items list
  Future<List<Item>> fetchItems() async {
    final response = await http.get(Uri.parse('$baseUrl/item/get'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => Item.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load items');
    }
  }

  Future<List<String>> fetchImages(List<int> itemIds) async {
  List<String> imageUrls = [];

  for (int itemId in itemIds) {
    final response = await http.get(Uri.parse('$baseUrl/items/serveImages/$itemId'));

    if (response.statusCode == 200) {
      // Handle the image response as bytes
      final imageBytes = response.bodyBytes;
      
      // Convert the bytes to a Base64 string to use in the frontend
      final base64Image = base64Encode(imageBytes);

      // Use a data URL format to display the image
      imageUrls.add('data:image/png;base64,$base64Image');
    } else {
      // If the image isn't found or there's an error, add a placeholder or empty image
      imageUrls.add('');
    }
  }

  return imageUrls;
}

}
