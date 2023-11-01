import 'package:async/async.dart';
import 'package:auto_play_video_sample/model/playable.dart' as pl;
import 'package:auto_play_video_sample/model/post.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

class MediaKitManager {
  MediaKitManager._init();
  static final MediaKitManager _instace = MediaKitManager._init();
  static MediaKitManager get instance => _instace;

  CustomPlayer? _player;

  final List<pl.PlayItem> _players = [];

  bool _isCurrentlyPlaying = false;

  bool get volume => true;
  set volume(bool newVolume) {}

  String get currentPlayingId {
    final index = _players.ext.indexOrNull((e) => e.player == _player);
    if (index == null) return '';
    return _players[index].id;
  }

  Future<void> play() async {
    if (_isCurrentlyPlaying) return;
    if (!_isMounted) return;
    await _player?.videoController.waitUntilFirstFrameRendered;
    _player
      // ignore: unawaited_futures
      ?..setVolume(volume ? 100 : 0)
      // ignore: unawaited_futures
      ..setPlaylistMode(PlaylistMode.single)
      // ignore: unawaited_futures
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

  pl.PlayItem _createVideoPlayer(Post post) {
    final p = CustomPlayer(post.url);
    final model = pl.PlayItem(
      id: post.id,
      player: p,
      placeholder: post.placeholder,
      source: '',
    );
    _players.add(model);
    p.init();
    return model;
  }

  pl.PlayItem getPlayerModelFromPostModel(Post post) {
    final index = _players.ext.indexOrNull((p0) => p0.id == post.id);
    if (index != null) return _players[index];
    return _createVideoPlayer(post);
  }

  Future<void> dispose(pl.Playable playable) async {
    if (!playable.player.mounted) return;
    await playable.player.dispose();
    _players.remove(playable);
  }

  bool get _isMounted => _player?.mounted ?? false;
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
    await operation.value.then((_) async {
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
