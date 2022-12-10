import 'package:flutter/material.dart';

import '../models/app_colors.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(10),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: AppColors.secondaryColor)),
            hintText: "Search..",
            hintStyle:
                const TextStyle(color: AppColors.secondaryColor, fontSize: 16),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
