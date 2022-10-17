import 'dart:convert';

/* Известные значения поля `content_warning`: `explicit`.

        Известные значения поля `type`: `music`.

        Поля `can_publish`, `state`, `desired_visibility`, `filename`, `user_info` доступны только у треков что были
        загружены пользователем.

        Обычно у подкастов поле `remember_position == True`, а у треков `remember_position == False`.

        Полное описание можно получить используя :func:`Track.get_supplement`.
*/

import 'package:yandex_music_api/src/request_client.dart';

import 'download_info.dart';

class Track {
  final String id;
  final String title;
  final bool available;
  //final List<Artist> artists;
  //final List<Album> albums;
  final bool availableForPremiumUsers;
  final bool lyricsAvailable;
  //final PoetryLoverMatch poetryLoverMatch;
  final bool best;
  final String realId;
  final String opImage;
  final String type;
  final String coverUri;
  //final Major major;
  final Duration duration;
  final int fileSize;
  //substituted
  //matched_track
  //normalization
  //error
  //can_publish
  //state
  //desired_visibility
  final String filename;
  //user_info
  //meta_data
  //regions
  final bool availableAsRbt;
  final String contentWarning;
  final bool explicit;
  final bool availableFullWithoutPermission;
  final bool rememberPosition;
  final List<DownloadInfo> downloadInfo;
  final String backgroundVideoUri;
  final String shortDescription;
  final bool isSuitableForChildren;
  Track({
    required this.id,
    required this.title,
    required this.available,
    required this.availableForPremiumUsers,
    required this.lyricsAvailable,
    required this.best,
    required this.realId,
    required this.opImage,
    required this.type,
    required this.coverUri,
    required this.duration,
    required this.fileSize,
    required this.filename,
    required this.availableAsRbt,
    required this.contentWarning,
    required this.explicit,
    required this.availableFullWithoutPermission,
    required this.rememberPosition,
    required this.downloadInfo,
    required this.backgroundVideoUri,
    required this.shortDescription,
    required this.isSuitableForChildren,
  });

  factory Track.fromMap(Map<String, dynamic> map, RequestClient client) {
    return Track(
      id: map['id'],
      title: map['title'],
      available: map['available'],
      availableForPremiumUsers: map['availableForPremiumUsers'],
      lyricsAvailable: map['lyricsAvailable'],
      best: map['best'],
      realId: map['realId'],
      opImage: map['opImage'],
      type: map['type'],
      coverUri: map['coverUri'],
      duration: Duration(milliseconds: map['duration']),
      fileSize: map['fileSize'],
      filename: map['filename'],
      availableAsRbt: map['availableAsRbt'],
      contentWarning: map['contentWarning'],
      explicit: map['explicit'],
      availableFullWithoutPermission: map['availableFullWithoutPermission'],
      rememberPosition: map['rememberPosition'],
      downloadInfo: List<DownloadInfo>.from(
          map['downloadInfo']?.map((x) => DownloadInfo.fromMap(x, client))),
      backgroundVideoUri: map['backgroundVideoUri'],
      shortDescription: map['shortDescription'],
      isSuitableForChildren: map['isSuitableForChildren'],
    );
  }

  factory Track.fromJson(String source, RequestClient client) =>
      Track.fromMap(json.decode(source), client);
}
