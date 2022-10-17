import 'dart:io';

import 'package:yandex_music_api/yandex_music_api.dart';

void main() async {
  final authFile = File('token.txt');

  final YandexAuth auth;
  if (authFile.existsSync()) {
    auth = YandexAuth.fromToken(authFile.readAsStringSync());
  } else {
    auth = await YandexAuth.authNamePassword('', '');
    authFile
      ..createSync()
      ..writeAsStringSync(auth.token);
  }

  final client = await YandexMusicClient.create(auth);
  final tracks = await client.userLikesPlaylists();
  print(tracks);
}
