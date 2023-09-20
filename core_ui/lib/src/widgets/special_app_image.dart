import 'package:flutter/material.dart';

class SpecialAppImage extends StatelessWidget {
  final String src;
  final double height;
  final double width;

  const SpecialAppImage({
    required this.src,
    required this.height,
    required this.width,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      src,
      height: height,
    );
  }
}
