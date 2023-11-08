import 'package:flutter/material.dart';

class TextFilledForSearch extends StatelessWidget {
  final Function(String) onChange;
  final Function(String) onSearchSubmitted;
  const TextFilledForSearch({super.key , required this.onChange , required this.onSearchSubmitted});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onSearchSubmitted,
      onChanged: onChange,
      decoration: InputDecoration(
        contentPadding:
            EdgeInsets.symmetric(vertical: 10.0), // adjust as needed

        fillColor: Color(0xFFF3F6F8),
        filled: true,
        hintText: "Search on STStore",
        hintStyle: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontFamily: 'DM Sans',
          fontWeight: FontWeight.w400,
        ),
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}



