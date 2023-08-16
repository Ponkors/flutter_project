import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class HeaderImageItem extends StatefulWidget {
  final String image;

  const HeaderImageItem({
    required this.image,
    super.key,
  });

  @override
  State<HeaderImageItem> createState() => _HeaderImageItemState();
}

class _HeaderImageItemState extends State<HeaderImageItem> {
  @override
  Widget build (BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Image.network(
        widget.image,
        fit: BoxFit.cover,
      ),
    );
  }
}