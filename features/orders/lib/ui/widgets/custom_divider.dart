import 'package:flutter/material.dart';

class TornCheckDivider extends StatelessWidget {
  final double thickness;
  final Color color;
  final double tornHeight;
  final double tornWidth;
  final double spacing;

  TornCheckDivider({
    this.thickness = 1.0,
    this.color = Colors.black,
    this.tornHeight = 5.0,
    this.tornWidth = 10.0,
    this.spacing = 5.0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            height: thickness,
            color: color,
          ),
        ),
        SizedBox(width: spacing),
        Container(
          height: tornHeight,
          width: tornWidth,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(tornWidth / 2),
          ),
        ),
        SizedBox(width: spacing),
        Expanded(
          child: Container(
            height: thickness,
            color: color,
          ),
        ),
      ],
    );
  }
}