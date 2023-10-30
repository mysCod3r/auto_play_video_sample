import 'package:auto_play_video_sample/manager/media_kit_manager.dart';
import 'package:auto_play_video_sample/manager/media_kit_model.dart';
import 'package:auto_play_video_sample/model/media_model.dart';
import 'package:auto_play_video_sample/view/post_detail_view.dart';
import 'package:auto_play_video_sample/widget/content_widget/video_widget.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class ContentVideoCard extends StatefulWidget {
  const ContentVideoCard({
    required this.model,
    super.key,
  });
  final VideoModel model;

  @override
  State<ContentVideoCard> createState() => _ContentVideoCardState();
}

class _ContentVideoCardState extends State<ContentVideoCard> {
  VideoPlayerModel get _model => MediaKitManager.instance.getVideoPlayerModelFromPostModel(widget.model);

  @override
  void dispose() {
    _model.player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => context.route.navigateToPage(PostDetailView(post: widget.model)),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                height: 50,
                width: context.sized.width,
                color: Colors.teal,
                child: const Text('User Info Area'),
              ),
              const SizedBox(height: 16),
              Text('content: ${widget.model.contentText}'),
              SizedBox(
                height: 200,
                width: context.sized.width,
                child: VideoWidget.square(
                  id: widget.model.id,
                  controller: _model.controller,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                alignment: Alignment.center,
                height: 50,
                width: context.sized.width,
                color: Colors.blueGrey,
                child: const Text('Action Buttons Area'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
