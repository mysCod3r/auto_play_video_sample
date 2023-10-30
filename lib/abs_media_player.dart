import 'package:media_kit/media_kit.dart';

abstract class MediaPlayer {
  Future<void> init();
  Future<void> play();
  Future<void> pause();
  Future<void> seek(Duration duration);
  Future<void> dispose();
}

class MediaPlayerManager {
  List<Playable> players = <Playable>[];
}

class VideoPlayer extends MediaPlayer {
  @override
  Future<void> dispose() {
    // TODO: implement dispose
    throw UnimplementedError();
  }

  @override
  Future<void> init() {
    // TODO: implement init
    throw UnimplementedError();
  }

  @override
  Future<void> pause() {
    // TODO: implement pause
    throw UnimplementedError();
  }

  @override
  Future<void> play() {
    // TODO: implement play
    throw UnimplementedError();
  }

  @override
  Future<void> seek(Duration duration) {
    // TODO: implement seek
    throw UnimplementedError();
  }
}

class SoundPlayer extends MediaPlayer {
  @override
  Future<void> dispose() {
    // TODO: implement dispose
    throw UnimplementedError();
  }

  @override
  Future<void> init() {
    // TODO: implement init
    throw UnimplementedError();
  }

  @override
  Future<void> pause() {
    // TODO: implement pause
    throw UnimplementedError();
  }

  @override
  Future<void> play() {
    // TODO: implement play
    throw UnimplementedError();
  }

  @override
  Future<void> seek(Duration duration) {
    // TODO: implement seek
    throw UnimplementedError();
  }
}
