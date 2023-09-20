import 'package:flutter/material.dart';
import 'loading_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CacheAppImage extends StatelessWidget {
  final String imageURL;
  final double height;
  final double width;

  const CacheAppImage({
    required this.imageURL,
    required this.height,
    required this.width,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: CachedNetworkImage(
        imageUrl: imageURL,
        height: height,
        width: width,
        placeholder: (
          BuildContext context,
          String url,
        ) {
          return const SizedBox(
            child: LoadingIndicator(),
          );
        },
      ),
    );
  }
}
