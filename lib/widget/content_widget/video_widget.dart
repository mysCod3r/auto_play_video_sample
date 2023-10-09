import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:media_kit_video/media_kit_video.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget.square({
    required this.id,
    required this.controller,
    required this.borderRadius,
    this.videoControls = AdaptiveVideoControls,
    super.key,
  }) : fit = BoxFit.cover;

  const VideoWidget.fullScreen({
    required this.id,
    required this.controller,
    required this.borderRadius,
    this.videoControls = AdaptiveVideoControls,
    super.key,
  }) : fit = BoxFit.contain;

  /// It will be used for [Hero]
  final String id;
  final BoxFit fit;
  final VideoController controller;
  final BorderRadiusGeometry borderRadius;
  final Widget Function(VideoState state) videoControls;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: Key(id),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: FutureBuilder<void>(
          future: controller.waitUntilFirstFrameRendered,
          builder: (context, AsyncSnapshot<void> snapshot) {
            return snapshot.connectionState == ConnectionState.waiting
                // [Thumbnail]
                ? const ColoredBox(
                    color: Colors.tealAccent,
                    child: Center(child: CircularProgressIndicator.adaptive()),
                  ) // thumb
                : Video(
                    wakelock: false,
                    controller: controller,
                    fit: fit,
                    controls: videoControls,
                  );
          },
        ),
      ),
    );
  }
}

// ignore: unused_element
class _Square extends StatelessWidget {
  const _Square(this.controller);
  final VideoController controller;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: controller.waitUntilFirstFrameRendered,
      builder: (context, snapshot) {
        return SizedBox(
          height: context.sized.width,
          width: context.sized.width,
          child: snapshot.connectionState == ConnectionState.done
              ? Video(
                  controller: controller,
                  wakelock: false,
                  fit: BoxFit.cover,
                )
              : const ColoredBox(color: Colors.pink),
        );
      },
    );
  }
}
