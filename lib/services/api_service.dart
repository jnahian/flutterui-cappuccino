// lib/services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://dev.wpcafe.app/app/api/v1";
  final String accept = "application/json";
  // final String static_token = "1778|jFqH3gTHGHv0ZyAs9Qv5AoT5nRPWO8oOM4Rmou4d";

  String? _token = "1778|jFqH3gTHGHv0ZyAs9Qv5AoT5nRPWO8oOM4Rmou4d";

  ApiService();

  void setToken(String token) {
    _token = token;
  }

  Future<Map<String, dynamic>> authenticateUser(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/authenticate'),
      headers: {'Accept': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to authenticate user');
    }
  }

  Future<Map<String, dynamic>> getUserData() async {
    final response = await http.get(
      Uri.parse('$baseUrl/user'),
      headers: {"Accept": accept, 'Authorization': 'Bearer $_token'},
    );

    if (response.statusCode == 200) {
      return json.decode(response.body)['data']['user'];
    } else {
      throw Exception('Failed to load user data');
    }
  }

  Future<dynamic> getRequest(String endpoint) async {
    final response = await http.get(
      Uri.parse('$baseUrl$endpoint'),
      headers: {"Accept": accept, 'Authorization': 'Bearer $_token'},
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<dynamic> postRequest(String endpoint, Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: {"Accept": accept, 'Authorization': 'Bearer $_token', 'Content-Type': accept},
      body: json.encode(data),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to post data');
    }
  }
}
