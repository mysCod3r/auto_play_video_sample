import 'package:auto_play_video_sample/model/post.dart';
import 'package:auto_play_video_sample/view/post_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class ContentTextCard extends StatelessWidget {
  const ContentTextCard({required this.post, super.key});
  final Post post;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => context.route.navigateToPage(PostDetailView(post: post)),
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
              const Text('content:zxcxzczxczxcxzc'),
              if (post.placeholder.ext.isNotNullOrNoEmpty) const SizedBox(height: 8),
              if (post.placeholder.ext.isNotNullOrNoEmpty) Image.network(post.placeholder),
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
