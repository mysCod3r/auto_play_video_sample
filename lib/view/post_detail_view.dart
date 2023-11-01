import 'package:auto_play_video_sample/manager/media_kit_manager.dart';
import 'package:auto_play_video_sample/model/playable.dart';
import 'package:auto_play_video_sample/model/post.dart';
import 'package:auto_play_video_sample/widget/content_widget/sound_widget.dart';
import 'package:auto_play_video_sample/widget/content_widget/video_widget.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class PostDetailView extends StatefulWidget {
  const PostDetailView({required this.post, super.key});
  final Post post;
  @override
  State<PostDetailView> createState() => _PostDetailViewState();
}

class _PostDetailViewState extends State<PostDetailView> {
  Playable? get _playable {
    switch (widget.post.contentType) {
      case ContentType.video:
      case ContentType.sound:
        return MediaKitManager.instance.getPlayerModelFromPostModel(widget.post);
      case ContentType.noMedia:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          if (_playable != null) _ContentMedia(playable: _playable!, post: widget.post),
          Container(
            color: Colors.cyanAccent,
            height: 50,
            width: context.sized.width,
          ),
          const Text('Post Detail Page'),
        ],
      ),
    );
  }
}

class _ContentMedia extends StatelessWidget {
  const _ContentMedia({required this.post, required this.playable});
  final Post post;
  final Playable playable;
  @override
  Widget build(BuildContext context) {
    return switch (post.contentType) {
      ContentType.video => _VideoWidget(post, playable.player),
      ContentType.sound => _SoundWidget(post),
      ContentType.noMedia => const SizedBox.shrink(),
    };
  }
}

class _VideoWidget extends StatelessWidget {
  const _VideoWidget(this.post, this.player);
  final Post post;
  final CustomPlayer player;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.sized.width,
      width: context.sized.width,
      child: VideoWidget.square(
        id: post.id,
        controller: player.videoController,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}

class _SoundWidget extends StatelessWidget {
  const _SoundWidget(this.post);
  final Post post;
  @override
  Widget build(BuildContext context) {
    return SoundWidget(
      id: post.id,
      imageUrl: post.placeholder,
      fit: BoxFit.cover,
      borderRadius: BorderRadius.circular(16),
    );
  }
}
