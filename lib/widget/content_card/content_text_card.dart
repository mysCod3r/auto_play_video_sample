import 'package:auto_play_video_sample/model/media_model.dart';
import 'package:auto_play_video_sample/view/post_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class ContentTextCard extends StatelessWidget {
  const ContentTextCard({required this.model, super.key});
  final NoMediaModel model;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => context.route.navigateToPage(PostDetailView(post: model)),
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
              Text('content: ${model.contentText}'),
              if (model.imageUrl.ext.isNotNullOrNoEmpty) const SizedBox(height: 8),
              if (model.imageUrl.ext.isNotNullOrNoEmpty) Image.network(model.imageUrl!),
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
