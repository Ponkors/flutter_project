import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:navigation/navigation.dart';

class DishScreen extends StatelessWidget {
  final MenuItemEntity _model;

  const DishScreen({
    super.key,
    required MenuItemEntity model,
  }) : _model = model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: <Widget>[
                Image.network(
                  _model.image,
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width,
                ),
                Positioned(
                  top: 30,
                  left: 20,
                  child: CupertinoButton(
                      onPressed: () {
                        context.router.pop();
                      },
                      padding: EdgeInsets.zero,
                      child: Icon(
                        CupertinoIcons.back,
                        color: AppColors.white,
                      ),
                    ),
                  ),
              ],
            ),
            Container(
              padding:
              const EdgeInsets.symmetric(horizontal: AppDimens.padding_25),
              margin: const EdgeInsets.only(top: AppDimens.padding_10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _model.name,
                      style: GoogleFonts.poppins(textStyle: AppFonts.normal_20),
                    ),
                    Text(
                      _model.details,
                      style: GoogleFonts.poppins(textStyle: AppFonts.normal_16),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: AppDimens.padding_10),
                      child: Text(
                        AppConstants.ingredients,
                        style:
                        GoogleFonts.poppins(textStyle: AppFonts.normal_18),
                      ),
                    ),
                    Text(
                      _model.ingredients,
                      style: GoogleFonts.poppins(textStyle: AppFonts.normal_16),
                    ),
                  ]),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: AppDimens.padding_60),
              child: Column(
                children: [
                  AddButton(),
                ],
              ),
            )
              ],
        ),
      ),
    );
  }
}