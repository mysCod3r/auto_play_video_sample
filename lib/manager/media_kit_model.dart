import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

sealed class MediaKitModel {
  const MediaKitModel({required this.id, required this.player});

  final String id;
  final Player player;
}

final class SoundPlayerModel extends MediaKitModel {
  const SoundPlayerModel({required super.id, required super.player});
}

final class VideoPlayerModel extends MediaKitModel {
  const VideoPlayerModel({required super.id, required super.player, required this.controller});

  final VideoController controller;
}
