import 'package:auto_play_video_sample/manager/media_kit_model.dart';
import 'package:auto_play_video_sample/model/media_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:async/async.dart';

class MediaKitManager {
  MediaKitManager._init();
  static final MediaKitManager _instace = MediaKitManager._init();
  static MediaKitManager get instance => _instace;

  CustomPlayer? _player;

  final List<PlayItem> _players = [];

  bool _isCurrentlyPlaying = false;

  bool get volume => true;
  set volume(bool newVolume) {}

  String get currentPlayingId {
    final index = _players.ext.indexOrNull((e) => e.player == _player);
    if (index == null) return '';
    return _players[index].id;
  }

  void play() {
    if (_isCurrentlyPlaying) return;
    if (!_isMounted) return;
    _player
      ?..setVolume(volume ? 100 : 0)
      ..setPlaylistMode(PlaylistMode.single)
      ..play();
    _isCurrentlyPlaying = true;
  }

  void pause() {
    if (!_isCurrentlyPlaying) return;
    if (!_isMounted) return;
    _player?.pause();
    _isCurrentlyPlaying = false;
  }

  void seekTo(Duration duration) {
    if (!_isMounted) return;
    _player?.seek(duration);
  }

  void setPlayer({required String id}) {
    final model = _players.firstWhereOrNull((element) => element.id == id);
    _player = model?.player;
  }

  void toggleVolume() {
    if (!_isMounted) return;
    _player?.setVolume(volume ? 0 : 100);
    volume = !volume;
  }

  VideoPlayerModel _createVideoPlayer(VideoModel videoModel) {
    final p = CustomPlayer(videoModel.videoUrl);
    final model = VideoPlayerModel(
      id: videoModel.id,
      player: p,
    );
    _videoPlayers.add(model);
    p.init();
    return model;
  }

  VideoPlayerModel getVideoPlayerModelFromPostModel(VideoModel videoModel) {
    final index = _videoPlayers.ext.indexOrNull((p0) => p0.id == videoModel.id);
    if (index != null) return _videoPlayers[index];
    return _createVideoPlayer(videoModel);
  }

  SoundPlayerModel _createSoundPlayer(SoundModel soundModel) {
    final p = CustomPlayer(soundModel.soundUrl);
    final model = SoundPlayerModel(id: soundModel.id, player: p);
    _soundPlayers.add(model);
    p.init();
    return model;
  }

  SoundPlayerModel getSoundPlayerModelFromPostModel(SoundModel model) {
    final index = _soundPlayers.ext.indexOrNull((p0) => p0.id == model.id);
    if (index != null) return _soundPlayers[index];
    return _createSoundPlayer(model);
  }

  bool get _isMounted => _player?.mounted == true;
}

class CustomPlayer extends Player with EquatableMixin {
  CustomPlayer(this.resource) : super() {
    videoController = VideoController(this);
    operation = CancelableOperation.fromFuture(
      Future.delayed(_duration),
    );
    mounted = true;
  }

  late bool mounted;

  final String resource;
  late final VideoController videoController;

  late final CancelableOperation<void> operation;

  final ValueNotifier<bool> isInitialized = ValueNotifier(false);

  static const _duration = Duration(seconds: 1);

  Future<void> init() async {
    await operation.value.whenComplete(() async {
      await open(Media(resource), play: false);
      await videoController.notifier.value?.waitUntilFirstFrameRendered;
      isInitialized.value = true;
    });
  }

  @override
  Future<void> dispose() {
    operation.cancel();
    mounted = false;
    return super.dispose();
  }

  @override
  List<Object?> get props => [resource];
}
