import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:yandex_music_api/src/client.dart';
import 'package:yandex_music_api/src/request_client.dart';

import 'account/account.dart';
import 'account/account_status.dart';

const oauthUrl = 'https://oauth.yandex.ru';
const clientId = '23cabbbdc6cd418abb4b39c32c41195d';
const clientSecret = '53bc75238f0c4d08a118e51fe9203300';

class YandexAuth {
  String token;

  late final headers = {
    'X-Yandex-Music-Client': 'YandexMusicAndroid/23020251',
    'Authorization': 'OAuth $token',
  };

  YandexAuth.fromToken(this.token);
  static Future<YandexAuth> authNamePassword(
    String username,
    String password, {
    String grantType = 'password',
  }) async {
    final url = '$oauthUrl/token';
    final data = <String, dynamic>{
      'grant_type': grantType,
      'client_id': clientId,
      'client_secret': clientSecret,
      'username': username,
      'password': password,
    };

    final response = await http.post(Uri.parse(url), body: data);
    final respJson = json.decode(response.body) as Map<String, dynamic>;

    final token = respJson['access_token'] as String;

    return YandexAuth.fromToken(token);
  }
}
