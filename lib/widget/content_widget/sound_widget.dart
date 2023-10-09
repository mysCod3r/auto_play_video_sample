import 'package:flutter/material.dart';

class SoundWidget extends StatelessWidget {
  const SoundWidget({
    required this.id,
    required this.imageUrl,
    required this.fit,
    required this.borderRadius,
    super.key,
  });
  final String id;
  final String imageUrl;
  final BoxFit fit;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: Key(id),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Image.network(imageUrl, fit: fit),
      ),
    );
  }
}
