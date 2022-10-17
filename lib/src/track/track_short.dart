import 'dart:convert';

class TrackShort {
  final String id;
  final String? albumId;
  final int? playCount;
  final bool? recent;
  //track

  late final trackId = albumId != null ? "$id:$albumId" : id;

  TrackShort({
    required this.id,
    required this.albumId,
    required this.playCount,
    required this.recent,
  });

  factory TrackShort.fromMap(Map<String, dynamic> map) {
    return TrackShort(
      id: map['id'],
      albumId: map['albumId'],
      playCount: map['playCount'],
      recent: map['recent'],
    );
  }

  factory TrackShort.fromJson(String source) =>
      TrackShort.fromMap(json.decode(source));
}
