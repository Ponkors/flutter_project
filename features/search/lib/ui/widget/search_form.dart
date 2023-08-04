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
          width: double.infinity,
          height: 90,
          // color: Colors.red,
          margin: EdgeInsets.only(left: 20, right: 20, top: 70),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                AppConstants.labelSearch,
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 1.1,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SearchField(),
            ],
          )),
      CategoryFoodList(),
    ]));
  }
}
