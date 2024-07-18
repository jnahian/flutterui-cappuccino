// lib/services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';

class ApiService {
  final String baseUrl = "https://dev.wpcafe.app/app/api/v1";
  final String accept = "application/json";
  // final String static_token = "1778|jFqH3gTHGHv0ZyAs9Qv5AoT5nRPWO8oOM4Rmou4d";
  final String? _token = localStorage.getItem('token');

  ApiService();

  Future<Map<String, dynamic>> authenticateUser(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': accept},
      body: jsonEncode({'email': email, 'password': password}),
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
      headers: {"Content-Type": accept, 'Authorization': 'Bearer $_token'},
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
      headers: {"Content-Type": accept, 'Authorization': 'Bearer $_token', 'Accept': accept},
    );

    print(_token);
    print(json.decode(response.body));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<dynamic> postRequest(String endpoint, Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: {'Authorization': 'Bearer $_token', 'Content-Type': accept},
      body: json.encode(data),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to post data');
    }
  }
}
