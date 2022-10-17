import 'dart:collection';
import 'dart:convert';

import 'package:yandex_music_api/src/track/track_short.dart';

class TracksList extends UnmodifiableListView<TrackShort> {
  final int uid;
  final int revision;

  late final tracksIds = map((track) => track.id);

  TracksList({
    required this.uid,
    required this.revision,
    required List<TrackShort> tracks,
  }) : super(tracks);

  factory TracksList.fromMap(Map<String, dynamic> map) {
    return TracksList(
      uid: map['uid'],
      revision: map['revision'],
      tracks: (map['tracks'] as List<dynamic>)
          .map((e) => TrackShort.fromMap(e))
          .toList(),
    );
  }

  factory TracksList.fromJson(String source) =>
      TracksList.fromMap(json.decode(source));
}
