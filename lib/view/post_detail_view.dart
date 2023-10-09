import 'package:auto_play_video_sample/manager/media_kit_manager.dart';
import 'package:auto_play_video_sample/manager/media_kit_model.dart';
import 'package:auto_play_video_sample/model/media_model.dart';
import 'package:auto_play_video_sample/widget/content_widget/sound_widget.dart';
import 'package:auto_play_video_sample/widget/content_widget/video_widget.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class PostDetailView extends StatefulWidget {
  const PostDetailView({required this.post, super.key});
  final PostMediaModel post;
  @override
  State<PostDetailView> createState() => _PostDetailViewState();
}

class _PostDetailViewState extends State<PostDetailView> {
  MediaKitModel? get _mediaKitModel {
    switch (widget.post) {
      case VideoModel():
        return MediaKitManager.instance.getVideoPlayerModelFromPostModel(widget.post as VideoModel);
      case SoundModel():
        return MediaKitManager.instance.getSoundPlayerModelFromPostModel(widget.post as SoundModel);
      case NoMediaModel():
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          if (_mediaKitModel != null) _ContentMedia(mediaKitModel: _mediaKitModel!, post: widget.post),
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
  const _ContentMedia({required this.mediaKitModel, required this.post});
  final MediaKitModel mediaKitModel;
  final PostMediaModel post;
  @override
  Widget build(BuildContext context) {
    return switch (mediaKitModel) {
      VideoPlayerModel() => _VideoWidget(mediaKitModel as VideoPlayerModel),
      SoundPlayerModel() => _SoundWidget(post as SoundModel),
    };
  }
}

class _VideoWidget extends StatelessWidget {
  const _VideoWidget(this.mediaKitModel);
  final VideoPlayerModel mediaKitModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.sized.width,
      width: context.sized.width,
      child: VideoWidget.square(
        id: mediaKitModel.id,
        controller: mediaKitModel.controller,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}

class _SoundWidget extends StatelessWidget {
  const _SoundWidget(this.model);
  final SoundModel model;
  @override
  Widget build(BuildContext context) {
    return SoundWidget(
      id: model.id,
      imageUrl: model.imageUrl,
      fit: BoxFit.cover,
      borderRadius: BorderRadius.circular(16),
    );
  }
}
