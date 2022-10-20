import 'dart:convert';

import 'package:yandex_music_api/src/account/user.dart';
import 'package:yandex_music_api/src/track/cover.dart';
import 'package:yandex_music_api/src/track/track_short.dart';

/*        Известные значения `visibility`: `public` - публичный плейлист, `private` - приватный плейлист.

        Известные значения `generated_playlist_type`: `playlistOfTheDay` - Плейлист дня, `recentTracks` - Премьера,
        `neverHeard` - Дежавю, `podcasts` - Подкасты недели, `missedLikes` - Тайник, `origin` - Плейлист с Алисой.

        Известные значения `type`: `missedLikes`, `recentTracks`.
*/

class Playlist {
  final User owner;
  final Cover cover;
  final int uid;
  final int kind;
  final String title;
  final int trackCount;
  final List<dynamic> tags;
  final int revision;
  final int snapshot;
  final String visibility;
  final bool collective;
  final String urlPart;
  final DateTime created;
  final DateTime modified;
  final bool available;
  final bool isBanner;
  final bool isPremiere;
  final Duration? duration;
  final String ogImage;
  final String ogTitle;
  final String? ogDescription;
  final String? image;
  final Cover coverWithoutText;
  final String? backgroundColor;
  final String? textColor;
  final String? dummyDescription;
  final String? dummyPageDescription;
  final String? dummyCover;
  final String? dummyRolloverCover;
  final int? metrikaId;
  final List<int>? coauthors;
  final List<dynamic> prerolls;
  final int likesCount;
  final List<Playlist>? similarPlaylists;
  final List<Playlist>? lastOwnerPlaylists;
  final String generatedPlaylistType;
  final String animatedCoverUri;
  final bool everPlayed;
  final String description;
  final String descriptionFormatted;
  final List<TrackShort>? tracks;
  Playlist({
    required this.owner,
    required this.cover,
    required this.uid,
    required this.kind,
    required this.title,
    required this.trackCount,
    required this.tags,
    required this.revision,
    required this.snapshot,
    required this.visibility,
    required this.collective,
    required this.urlPart,
    required this.created,
    required this.modified,
    required this.available,
    required this.isBanner,
    required this.isPremiere,
    required this.duration,
    required this.ogImage,
    required this.ogTitle,
    required this.ogDescription,
    required this.image,
    required this.coverWithoutText,
    required this.backgroundColor,
    required this.textColor,
    required this.dummyDescription,
    required this.dummyPageDescription,
    required this.dummyCover,
    required this.dummyRolloverCover,
    required this.metrikaId,
    required this.coauthors,
    required this.prerolls,
    required this.likesCount,
    required this.similarPlaylists,
    required this.lastOwnerPlaylists,
    required this.generatedPlaylistType,
    required this.animatedCoverUri,
    required this.everPlayed,
    required this.description,
    required this.descriptionFormatted,
    required this.tracks,
  });

  factory Playlist.fromMap(Map<String, dynamic> map) {
    return Playlist(
      owner: User.fromMap(map['owner']),
      cover: Cover.fromMap(map['cover']),
      uid: map['uid'],
      kind: map['kind'],
      title: map['title'],
      trackCount: map['trackCount'],
      tags: List<dynamic>.from(map['tags']),
      revision: map['revision'],
      snapshot: map['snapshot'],
      visibility: map['visibility'],
      collective: map['collective'],
      urlPart: map['urlPart'],
      created: DateTime.parse(map['created']),
      modified: DateTime.parse(map['modified']),
      available: map['available'],
      isBanner: map['isBanner'],
      isPremiere: map['isPremiere'],
      duration: map['duration'] == null ? null : Duration(milliseconds: map['duration']),
      ogImage: map['ogImage'],
      ogTitle: map['ogTitle'],
      ogDescription: map['ogDescription'],
      image: map['image'],
      coverWithoutText: Cover.fromMap(map['coverWithoutText']),
      backgroundColor: map['backgroundColor'],
      textColor: map['textColor'],
      dummyDescription: map['dummyDescription'],
      dummyPageDescription: map['dummyPageDescription'],
      dummyCover: map['dummyCover'],
      dummyRolloverCover: map['dummyRolloverCover'],
      metrikaId: map['metrikaId'],
      coauthors: map['coauthors'] == null ? null : List<int>.from(map['coauthors']),
      prerolls: List<dynamic>.from(map['prerolls'] ?? []),
      likesCount: map['likesCount'],
      similarPlaylists: map['similarPlaylists'] == null
          ? null
          : List<Playlist>.from(map['similarPlaylists'].map(
              (x) => Playlist.fromMap(x),
            )),
      lastOwnerPlaylists: map['lastOwnerPlaylists'] == null
          ? null
          : List<Playlist>.from(map['lastOwnerPlaylists'].map((x) => Playlist.fromMap(x))),
      generatedPlaylistType: map['generatedPlaylistType'],
      animatedCoverUri: map['animatedCoverUri'],
      everPlayed: map['everPlayed'],
      description: map['description'],
      descriptionFormatted: map['descriptionFormatted'],
      tracks: map['tracks'] == null
          ? null
          : List<TrackShort>.from(map['tracks']?.map((x) => TrackShort.fromMap(x))),
    );
  }

  factory Playlist.fromJson(String source) => Playlist.fromMap(json.decode(source));
}
