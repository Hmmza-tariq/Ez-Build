import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NetworkUtils {
  Future<String?> fetchUrl(Uri url, {Map<String, String>? header}) async {
    try {
      final response = await http.get(url, headers: header);
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
