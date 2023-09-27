import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class IngredientsListDish extends StatelessWidget {
  final List<String>? ingredientsList;

  const IngredientsListDish({
    this.ingredientsList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: ingredientsList?.map((ingredient) {
        return Padding(
          padding: EdgeInsets.all(0),
          child: Text(
            ingredient ?? '',
            style: GoogleFonts.poppins(
              textStyle: AppFonts.normal_16,
            ),
          ),
        );
      }).toList() ?? [],
    );
  }
}
