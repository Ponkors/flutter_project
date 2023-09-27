import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'loading_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CacheAppImage extends StatelessWidget {
  final String imageURL;
  final double height;
  final BoxFit fit;


  const CacheAppImage({
    required this.imageURL,
    required this.height,
    this.fit = BoxFit.cover,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Container(
        width: AppDimens.size_140,
        height: AppDimens.size_140,
        child: CachedNetworkImage(
          imageUrl: imageURL,
          height: height,
          fit: fit,
          placeholder: (
              BuildContext context,
              String url,
              ) {
            return const SizedBox(
              child: LoadingIndicator(),
            );
          },
        ),
      )
    );
  }
}
