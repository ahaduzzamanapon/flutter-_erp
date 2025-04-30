import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // API Base URL
  static const String _baseUrl = 'https://hrseba.mysoftheaven.com/api_aj'; // Use your actual base URL

  static String _apiKey = ''; // Will be set dynamically for each user session
  static String userData = ''; // Will be set dynamically for each user session
  // Set API Key dynamically (optional)
  static void setApiKey(String apiKey) {
    _apiKey = apiKey;
  }

  // Login using MultipartRequest (as in your original code)
  static Future<Map<String, dynamic>> login(String username, String password) async {
    var uri = Uri.parse('$_baseUrl/auth/login');

    var request = http.MultipartRequest('POST', uri);
    request.fields.addAll({
      'username': username,
      'password': password,
    });

    // Optional cookie header — replace session value as needed
    request.headers.addAll({
      'Cookie': 'ci_session=2bkld5c0lfglg5vau1dcnjcjhuad2r4u',
    });

    http.StreamedResponse streamedResponse = await request.send();


    if (streamedResponse.statusCode == 200) {
      final responseString = await streamedResponse.stream.bytesToString();
      final Map<String, dynamic> responseData = json.decode(responseString);
      // Store API key if returned
      userData=responseData['data']['id_number'] ?? '';
      _apiKey =responseData['data']['api_key'] ?? '';
      return responseData['data'];
    } else {
      final error = await streamedResponse.stream.bytesToString();
      throw Exception('Failed to login: ${streamedResponse.statusCode} - $error');
    }
  }

  // Fetch posts using GET request with optional token
  static Future<List<dynamic>> fetchPosts() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/posts'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_apiKey',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load posts');
    }
  }

  // Registration API (basic JSON-based)
  static Future<Map<String, dynamic>> register(String name, String email, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/register'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'name': name, 'email': email, 'password': password}),
    );

    if (response.statusCode == 201) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return responseData;
    } else {
      throw Exception('Failed to register');
    }
  }

  // Logout (clear saved API key)
  static void logout() {
    _apiKey = '';
  }


}
