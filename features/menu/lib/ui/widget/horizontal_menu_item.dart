import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class HorizontalMenuItem extends StatefulWidget {
  final String name;
  final String ingredients;
  final String image;
  final double cost;

  const HorizontalMenuItem({
    required this.name,
    required this.ingredients,
    required this.image,
    required this.cost,
    super.key,
  });

  @override
  State<HorizontalMenuItem> createState() => _HorizontalMenuItemState();
}

class _HorizontalMenuItemState extends State<HorizontalMenuItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimens.size_140,
      height: AppDimens.size_200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: AppDimens.size_140,
            height: AppDimens.size_140,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppDimens.radius_10),
              child: Image.network(widget.image),
            ),
          ),
          Text(
            widget.name,
            style: GoogleFonts.gothicA1(textStyle: AppFonts.normal_16),
          ),
          Text(
            '\$\$ ● Chinese',
            style:
            GoogleFonts.poppins(textStyle: AppFonts.normal_14)
                .copyWith(color: AppColors.grey),
          ),
        ],
      ),
    );
  }
}
