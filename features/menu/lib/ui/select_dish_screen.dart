import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class SelectDishScreen extends StatelessWidget {
  final DishModel dish;

  const SelectDishScreen({
    required this.dish,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(dish.title),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(AppDimens.padding_20),
          child: Column(
            children: <Widget>[
              Center(
                child: Hero(
                  tag: dish.imageURL,
                  child: Container(
                    width: AppDimens.size_350,
                    height: AppDimens.size_350,
                    child: Image.network(
                      dish.imageURL,
                      fit: BoxFit.cover,
                    ),
                  )
                ),
              ),
              const SizedBox(
                height: AppDimens.size_10,
              ),
              Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        dish.title,
                        style: GoogleFonts.poppins(
                            textStyle: AppFonts.s28_w700,
                        ),
                      ),
                      const SizedBox(
                        height: AppDimens.size_10,
                      ),
                      Text(
                        'selectDishScreen.ingredients'.tr(),
                        style: GoogleFonts.poppins(
                          textStyle: AppFonts.normal_18,
                          color: AppColors.orange,
                        ),
                      ),
                      const SizedBox(
                        height: AppDimens.size_10,
                      ),
                      Text(
                        'Description:',
                        style: GoogleFonts.poppins(
                          textStyle: AppFonts.normal_18,
                          color: AppColors.orange,
                        ),
                      ),
                      const SizedBox(
                        height: AppDimens.size_10,
                      ),
                      Text(
                        '${'selectDishScreen.cost'.tr()}: \$${dish.cost}',
                        style: GoogleFonts.poppins(
                          textStyle: AppFonts.normal_20,
                          color: AppColors.orange,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
