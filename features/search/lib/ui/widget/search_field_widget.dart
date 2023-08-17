import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  bool _isSearching = false;
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        setState(() {
          _isSearching = false;
        });
      },
      child: Container(
        height: 48, // Because TextField height is 48.
        child: SizedBox(
          height: 50,
          child: TextField(
          controller: _searchController,
          onTap: () {
            setState(() {
              _isSearching = true;
            });
          },
          onChanged: (value) {
            // Handle search logic here if needed
          },
          onSubmitted: (value) {
            // Handle search submission logic here if needed
          },
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: _isSearching ? AppColors.orange : AppColors.grey,
            ),
            hintText: _isSearching ? "" : AppConstants.searchDefaultText,
            hintStyle: GoogleFonts.poppins(
              textStyle: AppFonts.normal_16
            ),
            border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            filled: true,
            fillColor: AppColors.lightGrey,
          ),
        ),
      ),
    ));
  }
}
