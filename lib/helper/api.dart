import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url, String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        'Authorization': "Bearer $token",
      });
    }

    final response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("HTTP ${response.statusCode} - ${response.reasonPhrase}");
    }
  }

  Future<dynamic> post(
      {required String url, required dynamic body, String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        'Authorization': "Bearer $token",
      });
    }

    final response =
        await http.post(Uri.parse(url), body: body, headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("HTTP ${response.statusCode} - ${response.reasonPhrase}");
    }
  }

  Future<dynamic> put(
      {required String url, required dynamic body, String? token}) async {
    Map<String, String> headers = {
      'Content-Type': "application/json",
    };
    if (token != null) {
      headers.addAll({
        'Authorization': "Bearer $token",
      });
    }

    final response = await http.put(Uri.parse(url),
        body: jsonEncode(body), headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("HTTP ${response.statusCode} - ${response.reasonPhrase}");
    }
  }
}
