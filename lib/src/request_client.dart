import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:yandex_music_api/src/auth.dart';

const userAgent = 'Yandex-Music-API';

class RequestClient {
  final _httpClient = http.Client();
  final YandexAuth auth;

  RequestClient(this.auth);

  Future<Object> get(String url) async {
    final response =
        await _httpClient.get(Uri.parse(url), headers: auth.headers);
    final respMap = json.decode(response.body);
    return respMap['result'];
  }

  Future<http.Response> retrieve(String url) =>
      _httpClient.get(Uri.parse(url), headers: auth.headers);

  Future<Object> post(String url, Object? body) async {
    final response = await _httpClient.post(
      Uri.parse(url),
      body: body,
    );
    final respMap = json.decode(response.body);

    return respMap['result'];
  }
}
