import 'package:auto_play_video_sample/manager/media_kit_manager.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

abstract class Playable {
  Playable({
    required this.id,
    required this.player,
    required this.source,
    this.placeholder,
  });

  final String id;
  final CustomPlayer player;
  final String source;
  final String? placeholder;
}

class PlayItem extends Playable {
  PlayItem({
    required this.id,
    required this.player,
    required this.source,
    this.placeholder,
  });

  factory PlayItem.createFromPost(String post) {
    return PlayItem(
      id: post.id,
      player: CustomPlayer(post.uri),
      source: post.uri,
    );
  }
}
