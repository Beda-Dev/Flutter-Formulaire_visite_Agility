import 'dart:convert';
import 'package:http/http.dart' as http;
import '/models/user.dart';

class AuthService {
  final String apiUrl = 'https://sibeton-api.vercel.app/api/users/auth';

  Future<Map<String, dynamic>> login(User user) async {
    final url = Uri.parse(apiUrl);

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode(user.toJson()),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to log in: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
