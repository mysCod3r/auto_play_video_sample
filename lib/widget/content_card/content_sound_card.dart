import 'package:auto_play_video_sample/manager/media_kit_manager.dart';
import 'package:auto_play_video_sample/model/playable.dart';
import 'package:auto_play_video_sample/model/post.dart';
import 'package:auto_play_video_sample/view/post_detail_view.dart';
import 'package:auto_play_video_sample/widget/content_widget/sound_widget.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class ContentSoundCard extends StatefulWidget {
  const ContentSoundCard({required this.post, super.key});

  final Post post;
  @override
  State<ContentSoundCard> createState() => _ContentSoundCardState();
}

class _ContentSoundCardState extends State<ContentSoundCard> {
  Playable get _model => MediaKitManager.instance.getPlayerModelFromPostModel(widget.post);

  @override
  void dispose() {
    MediaKitManager.instance.dispose(_model);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => context.route.navigateToPage(PostDetailView(post: widget.post)),
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
              const Text('content: asdasdasdxzczxcasdad'),
              const SizedBox(height: 8),
              SoundWidget(
                id: widget.post.id,
                imageUrl: widget.post.placeholder,
                fit: BoxFit.cover,
                borderRadius: BorderRadius.circular(16),
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
