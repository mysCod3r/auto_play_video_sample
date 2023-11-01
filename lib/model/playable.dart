import 'package:auto_play_video_sample/manager/media_kit_manager.dart';
import 'package:auto_play_video_sample/model/post.dart';

abstract class Playable {
  Playable({
    required this.id,
    required this.player,
    required this.source,
    required this.placeholder,
  });

  final String id;
  final CustomPlayer player;
  final String source;
  final String placeholder;
}

class PlayItem extends Playable {
  PlayItem({
    required super.id,
    required super.player,
    required super.source,
    required super.placeholder,
  });

  factory PlayItem.createFromPost(Post post) {
    return PlayItem(
      id: post.id,
      player: CustomPlayer(post.url),
      source: post.url,
      placeholder: post.placeholder,
    );
  }
}
