import 'package:auto_play_video_sample/manager/media_kit_manager.dart';
import 'package:auto_play_video_sample/model/media_model.dart';
import 'package:auto_play_video_sample/model/posts.dart';
import 'package:auto_play_video_sample/widget/content_card/content_sound_card.dart';
import 'package:auto_play_video_sample/widget/content_card/content_text_card.dart';
import 'package:auto_play_video_sample/widget/content_card/content_video_card.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with AutomaticKeepAliveClientMixin {
  final ItemPositionsListener _itemPositionsListener =
      ItemPositionsListener.create();

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

        if (MediaKitManager.instance.currentPlayingId !=
            allPosts[closestToMiddle.index].id) {
          MediaKitManager.instance
            ..pause()
            ..setPlayer(id: allPosts[closestToMiddle.index].id)
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
        body: ScrollablePositionedList.separated(
          itemPositionsListener: _itemPositionsListener,
          separatorBuilder: (_, __) => const Divider(height: 32),
          itemCount: allPosts.length,
          minCacheExtent: 0,
          padding: const EdgeInsets.all(8),
          itemBuilder: (context, index) {
            return switch (allPosts[index]) {
              VideoModel() =>
                ContentVideoCard(model: allPosts[index] as VideoModel),
              SoundModel() =>
                ContentSoundCard(model: allPosts[index] as SoundModel),
              NoMediaModel() =>
                ContentTextCard(model: allPosts[index] as NoMediaModel),
            };
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
