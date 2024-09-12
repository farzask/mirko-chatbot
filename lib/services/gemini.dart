import 'dart:convert';
import 'package:http/http.dart' as http;

class GeminiApi {
  static const String baseUrl = 'https://api.gemini.com/v1';

  // Method to get the ticker data for a specific symbol
  Future<Map<String, dynamic>> getTicker(String symbol) async {
    final response = await http.get(Uri.parse('$baseUrl/pubticker/$symbol'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load ticker data');
    }
  }

  // Add more methods for other endpoints as needed
}
