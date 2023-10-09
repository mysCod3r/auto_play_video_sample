import 'package:auto_play_video_sample/manager/media_kit_manager.dart';
import 'package:auto_play_video_sample/model/posts.dart';
import 'package:auto_play_video_sample/widget/content_card/content_video_card.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> with AutomaticKeepAliveClientMixin {
  final ItemPositionsListener _itemPositionsListener = ItemPositionsListener.create();
  @override
  void initState() {
    super.initState();
    _itemPositionsListener.itemPositions.addListener(() {
      final positions = _itemPositionsListener.itemPositions.value;
      if (positions.isNotEmpty) {
        /// The code is finding the item position that is closest to the middle of the screen.
        final closestToMiddle = positions.reduce((closest, current) {
          final close = closest.itemLeadingEdge + closest.itemTrailingEdge;
          final curr = current.itemLeadingEdge + current.itemTrailingEdge;
          // 1 refers to the entire screen.
          return (curr - 1).abs() < (close - 1).abs() ? current : closest;
        });
        if (MediaKitManager.instance.currentPlayingId != videoPosts[closestToMiddle.index].id) {
          MediaKitManager.instance
            ..pause()
            ..setPlayer(id: videoPosts[closestToMiddle.index].id)
            ..play();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Scaffold(
        body: ScrollablePositionedList.builder(
          itemPositionsListener: _itemPositionsListener,
          itemCount: videoPosts.length,
          padding: const EdgeInsets.all(8),
          itemBuilder: (context, index) {
            return ContentVideoCard(model: videoPosts[index]);
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
