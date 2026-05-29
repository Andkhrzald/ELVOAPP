import 'dart:convert';
import 'package:http/http.dart' as http;
import '../inti/konstanta.dart';

class LayananApi {
  static Future<Map<String, dynamic>> login(
    String username,
    String password,
  ) async {
    try {
      final response = await http.post(
        Uri.parse(Konstanta.baseUrlLogin),
        body: {'username': username, 'password': password},
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        final body = jsonDecode(response.body);
        return {
          'status': 'error',
          'message': body['message'] ?? 'Error server (${response.statusCode})',
        };
      }
    } catch (e) {
      return {'status': 'error', 'message': 'Gagal terhubung ke server'};
    }
  }

  static Future<Map<String, dynamic>> daftar(
    String username,
    String email,
    String password,
  ) async {
    try {
      final response = await http.post(
        Uri.parse(Konstanta.baseUrlDaftar),
        body: {'username': username, 'email': email, 'password': password},
      );

      final body = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return body;
      } else {
        return {
          'status': 'error',
          'message': body['message'] ?? 'Error server (${response.statusCode})',
        };
      }
    } catch (e) {
      return {'status': 'error', 'message': 'Gagal terhubung ke server'};
    }
  }
}
