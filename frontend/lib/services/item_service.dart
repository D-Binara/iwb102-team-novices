import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ItemService {
  final String baseUrl;

  ItemService(this.baseUrl);

  // Method to submit form data
  Future<int?> addItem({
    required String itemName,
    required String itemQuantity,
    required String itemPrice,
    required String itemCategory,
    required String location,
    required String details,
  }) async {
    var body = jsonEncode({
      'item_name': itemName,
      'item_quantity': itemQuantity,
      'item_price': itemPrice,
      'item_category': itemCategory,
      'item_image': '', 
      'location': location,
      'details': details,
    });

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/items/add'),
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      if (response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);
        return jsonResponse['item_id']; // Return item ID for further use
      } else {
        throw Exception('Failed to add item: ${response.body}');
      }
    } catch (e) {
      print(e);
      return null; // Handle error accordingly
    }
  }

  // Method to upload image
  Future<bool> uploadImage(File image, int itemId) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseUrl/item/image'),
    );

    request.files.add(await http.MultipartFile.fromPath('file', image.path));

    try {
      var response = await request.send();
      return response.statusCode == 201; // Return success status
    } catch (e) {
      print('Failed to upload image: $e');
      return false; // Handle error accordingly
    }
  }
}