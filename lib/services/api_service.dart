// lib/services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://dev.wpcafe.app/app/api/v1";
  final String accept = "application/json";
  final String token = "Bearer 1778|jFqH3gTHGHv0ZyAs9Qv5AoT5nRPWO8oOM4Rmou4d";

  ApiService();

  Future<dynamic> getRequest(String endpoint) async {
    final response = await http.get(
      Uri.parse('$baseUrl$endpoint'),
      headers: {"Accept": accept, "Authorization": token},
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<dynamic> postRequest(
      String endpoint, Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: {"Accept": accept, "Authorization": token},
      body: json.encode(data),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to post data');
    }
  }
}
