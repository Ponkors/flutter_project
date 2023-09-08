import 'category_list.dart';
import 'search_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:core_ui/core_ui.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Container(
          width: MediaQuery.of(context).size.width,
          height: 100,
          // color: Colors.red,
          margin: EdgeInsets.only(left: 20, right: 20, top: 70),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                AppConstants.labelSearch,
                style: GoogleFonts.poppins(textStyle: AppFonts.s28_w700),
              ),
              SizedBox(
                height: 10,
              ),
              SearchField(),
            ],
          )),
      SizedBox(
        height: 20,
      ),
      CategoryFoodList(),
    ]));
  }
}
