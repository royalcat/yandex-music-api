import 'package:yandex_music_api/src/auth.dart';
import 'package:yandex_music_api/src/track/track.dart';
import 'package:yandex_music_api/src/track/track_short.dart';
import 'package:yandex_music_api/src/track/tracks_list.dart';

import 'account/account_status.dart';
import 'feed/playlist.dart';
import 'track/download_info.dart';
import 'request_client.dart';

const baseUrl = 'https://api.music.yandex.net';

class YandexMusicClient {
  final RequestClient requestClient;
  AccountStatus accountStatus;

  YandexMusicClient._(
    this.requestClient,
    this.accountStatus,
  );

  static Future<YandexMusicClient> create(YandexAuth auth) async {
    final requestClient = RequestClient(auth);
    final accountStatus = await _getAccountStatus(requestClient);
    return YandexMusicClient._(requestClient, accountStatus);
  }

  Future<AccountStatus> refreshAccountStatus() async =>
      accountStatus = await _getAccountStatus(requestClient);

  static Future<AccountStatus> _getAccountStatus(
      RequestClient requestClient) async {
    const url = '$baseUrl/account/status';
    final result = await requestClient.get(url);
    return AccountStatus.fromMap(result as Map<String, dynamic>);
  }

  Future<List<DownloadInfo>> trackDownloadInfo(int trackId) async {
    final response =
        await requestClient.get('$baseUrl/tracks/$trackId/download-info');
    final diList = <DownloadInfo>[];
    for (final info in (response as Map<String, dynamic>)['result']) {
      diList.add(DownloadInfo.fromMap(info, requestClient));
    }

    return diList;
  }

  Future<dynamic> getLikes({
    required String objectType,
    int? userId,
  }) async {
    userId ??= accountStatus.account.uid;
    final url = '$baseUrl/users/$userId/likes/${objectType}s';
    final result = await requestClient.get(url);
    return result;
  }

  Future<TracksList> userLikesTracks({
    int? userId,
  }) async {
    final result = await getLikes(
      objectType: 'track',
      userId: userId,
    );
    return TracksList.fromMap(result);
  }

  Future<List<Playlist>> userLikesPlaylists({
    int? userId,
  }) async {
    final result = await getLikes(
      objectType: 'playlist',
      userId: userId,
    );
    return (result as List<dynamic>)
        .map((e) => Playlist.fromMap(e['playlist']))
        .toList();
  }

  Future<List<Playlist>> userPlaylists({
    String? userId,
    required List<String> kind,
  }) async {
    userId ??= accountStatus.account.uid.toString();
    final dynamic result;
    if (kind.length == 1) {
      final url = '$baseUrl/users/$userId/playlists/${kind.first}';
      result = await requestClient.get(url);
    } else {
      final url = '$baseUrl/users/$userId/playlists';

      final data = {'kinds': kind};
      result = await requestClient.post(url, data);
    }

    return (result as List<dynamic>).map((e) => Playlist.fromMap(e)).toList();
  }
}
