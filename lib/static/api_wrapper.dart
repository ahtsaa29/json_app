import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:json_api/static/urls.dart';

class ApiWrapper {
  final String baseUrl = urls.baseUrl;

  Future get(String url) async {
    log(baseUrl + url);
    var response = await http.get(
      Uri.parse(baseUrl + url),
      headers: <String, String>{
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    ).timeout(
      const Duration(seconds: 10),
      onTimeout: () {
        return http.Response('Error', 408);
      },
    );
    log("Response: ${response.body} with ${response.statusCode} from ${baseUrl + url}");

    if (response.statusCode == 200) {
      return response.body;
    } else if (response.statusCode == 503) {
      return response.statusCode;
    }
  }

  Future post(String url, String body) async {
    var response = await http.post(
      Uri.parse(baseUrl + url),
      body: body,
      headers: <String, String>{
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    log("Response: ${response.body} with ${response.statusCode} from ${baseUrl + url}");

    return response.body;
  }

  Future put(String url, String body) async {
    var response = await http.put(
      Uri.parse(baseUrl + url),
      body: body,
      headers: <String, String>{
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    return response.body;
  }

  Future delete(String url, String id) async {
    var response = await http.delete(
      Uri.parse("$baseUrl$url/$id"),
      headers: <String, String>{
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    return response.body;
  }
}
