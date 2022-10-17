// playlist types `type`: `playlistOfTheDay`, `origin`, `recentTracks`, `neverHeard`, `podcasts`, `missedLikes`.
import 'package:yandex_music_api/src/feed/playlist.dart';

class GeneratedPlaylist {
  String type;
  bool ready;
  bool notify;
  Playlist data;
  String description;

  GeneratedPlaylist({
    required this.type,
    required this.ready,
    required this.notify,
    required this.data,
    required this.description,
  });
}
