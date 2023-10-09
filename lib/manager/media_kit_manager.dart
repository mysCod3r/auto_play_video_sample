import 'package:auto_play_video_sample/manager/media_kit_model.dart';
import 'package:auto_play_video_sample/model/media_model.dart';
import 'package:kartal/kartal.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

class MediaKitManager {
  MediaKitManager._init();
  static final MediaKitManager _instace = MediaKitManager._init();
  static MediaKitManager get instance => _instace;

  Player? _player;

  final List<VideoPlayerModel> _videoPlayers = [];
  final List<SoundPlayerModel> _soundPlayers = [];

  List<MediaKitModel> get _players => [..._videoPlayers, ..._soundPlayers];

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
    _player
      ?..setVolume(volume ? 100 : 0)
      ..setPlaylistMode(PlaylistMode.single)
      ..play();
    _isCurrentlyPlaying = true;
  }

  void pause() {
    if (!_isCurrentlyPlaying) return;
    _player?.pause();
    _isCurrentlyPlaying = false;
  }

  void seekTo(Duration duration) {
    _player?.seek(duration);
  }

  void setPlayer({required String id}) {
    final model = _players.firstWhereOrNull((element) => element.id == id);
    _player = model?.player;
  }

  void toggleVolume() {
    _player?.setVolume(volume ? 0 : 100);
    volume = !volume;
  }

  VideoPlayerModel _createVideoPlayer(VideoModel videoModel) {
    final p = Player();
    final c = VideoController(p);
    p.open(Media(videoModel.videoUrl), play: false);
    final model = VideoPlayerModel(id: videoModel.id, player: p, controller: c);
    _videoPlayers.add(model);
    return model;
  }

  VideoPlayerModel getVideoPlayerModelFromPostModel(VideoModel videoModel) {
    final index = _videoPlayers.ext.indexOrNull((p0) => p0.id == videoModel.id);
    if (index != null) return _videoPlayers[index];
    return _createVideoPlayer(videoModel);
  }

  SoundPlayerModel _createSoundPlayer(SoundModel soundModel) {
    final p = Player()..open(Media(soundModel.soundUrl), play: false);
    final model = SoundPlayerModel(id: soundModel.id, player: p);
    _soundPlayers.add(model);
    return model;
  }

  SoundPlayerModel getSoundPlayerModelFromPostModel(SoundModel model) {
    final index = _soundPlayers.ext.indexOrNull((p0) => p0.id == model.id);
    if (index != null) return _soundPlayers[index];
    return _createSoundPlayer(model);
  }
}
