import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url, String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        'Authorization': "Bearer $token",
      });
    }

    try {
      log('GET Request: $url\nHeaders: $headers');
      final response = await http.get(Uri.parse(url), headers: headers);
      return _handleResponse(response);
    } catch (e) {
      throw Exception('Failed to GET from $url: $e');
    }
  }

  Future<dynamic> post(
      {required String url, required dynamic body, String? token}) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    if (token != null) {
      headers.addAll({
        'Authorization': "Bearer $token",
      });
    }

    try {
      log('POST Request: $url\nHeaders: $headers\nBody: $body');
      final response = await http.post(Uri.parse(url),
          body: jsonEncode(body), headers: headers);
      return _handleResponse(response);
    } catch (e) {
      throw Exception('Failed to POST to $url: $e');
    }
  }

  Future<dynamic> put(
      {required String url, required dynamic body, String? token}) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    if (token != null) {
      headers.addAll({
        'Authorization': "Bearer $token",
      });
    }

    try {
      log('PUT Request: $url\nHeaders: $headers\nBody: $body');
      final response = await http.put(Uri.parse(url),
          body: jsonEncode(body), headers: headers);
      log('response from server every think ok  ${response.body}');
      return _handleResponse(response);
    } catch (e) {
      throw Exception('Failed to PUT to $url: $e');
    }
  }

  dynamic _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'HTTP ${response.statusCode} - ${response.reasonPhrase}\nBody: ${response.body}');
    }
  }
}
