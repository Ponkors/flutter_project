import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class MenuItem extends StatefulWidget {
  final String name;
  final String ingredients;
  final String image;
  final double cost;

  const MenuItem({
    required this.name,
    required this.ingredients,
    required this.image,
    required this.cost,
    super.key,
  });

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: AppDimens.size_110,
          height: AppDimens.size_110,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppDimens.radius_10),
            child: Image.network(widget.image),
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: AppDimens.padding_20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  widget.name,
                  style: GoogleFonts.poppins(
                      textStyle: AppFonts.normal_18),
                ),
                Text(
                  widget.ingredients,
                  softWrap: true,
                  style: GoogleFonts.poppins(
                      textStyle: AppFonts.normal_16),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: AppDimens.padding_10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        '\$\$ ● Chinese',
                        style: GoogleFonts.poppins(
                            textStyle: AppFonts.normal_14).copyWith(
                            color: AppColors.grey
                        ),
                      ),
                      SizedBox(width: AppDimens.size_40),
                      Text(
                        'AUD\$${widget.cost}',
                        textAlign: TextAlign.right,
                        style: GoogleFonts.poppins(
                            textStyle: AppFonts.bold_16).copyWith(
                            color: AppColors.orange
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
