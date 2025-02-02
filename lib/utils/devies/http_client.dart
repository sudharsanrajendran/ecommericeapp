import 'dart:convert';
import 'package:http/http.dart' as http;

class Thttphelper {
  static const String url = "https://dummyjson.com/products"; // API base URL
  // Fetch data method

  Future<List<Map<String, dynamic>>> fetchProducts() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List products = json.decode(response.body)['products'];
      return products.cast<Map<String, dynamic>>(); // Convert to List<Map>
    } else {
      throw Exception('Failed to load products');
    }
  }

  // Helper method to make POST request
  static Future<Map<String, dynamic>> post(String endpoint, dynamic data) async {
    final response = await http.post(
      Uri.parse('$url/$endpoint'),
      headers: _getHeaders(),
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

  // Helper method to make PUT request
  static Future<Map<String, dynamic>> put(String endpoint, dynamic data) async {
    final response = await http.put(
      Uri.parse('$url/$endpoint'),
      headers: _getHeaders(),
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

  // Helper method to make DELETE request
  static Future<Map<String, dynamic>> delete(String endpoint) async {
    final response = await http.delete(Uri.parse('$url/$endpoint'));
    return _handleResponse(response);
  }

  // Private helper method to prepare headers
  static Map<String, String> _getHeaders() {
    return {'Content-Type': 'application/json'};
  }

  // Private helper method to handle response
  static Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data. Status code: ${response.statusCode}');
    }
  }
}
