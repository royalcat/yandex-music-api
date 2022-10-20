import 'dart:io';

import 'package:yandex_music_api/yandex_music_api.dart';

void main() async {
  final authFile = File('token.txt');

  final YandexAuth auth;
  if (authFile.existsSync()) {
    auth = YandexAuth.fromToken(authFile.readAsStringSync());
  } else {
    throw Exception("Authentication file not found");
  }

  final client = await YandexMusicClient.create(auth);

  print(client.accountStatus);
  final tracks = await client.userLikesTracks();
  for (final track in tracks) {
    print(track.trackId);
    final dinfos = await client.trackDownloadInfo(track.trackId);
    print(await dinfos[0].directLink);
  }
}
