import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      "http://127.0.0.1/login_api/login.php"; // SESUAIKAN PATH

  static Future<Map<String, dynamic>> login(
    String username,
    String password,
  ) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        body: {'username': username, 'password': password},
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return {
          'status': 'error',
          'message': 'Server error (${response.statusCode})',
        };
      }
    } catch (e) {
      return {'status': 'error', 'message': 'Gagal terhubung ke server'};
    }
  }
}
