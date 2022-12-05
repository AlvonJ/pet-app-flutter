import 'package:flutter/material.dart';
import 'package:pet_app/models/app_colors.dart';

class SubTitle extends StatelessWidget {
  final String title;
  const SubTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 22),
        ),
        TextButton(
          onPressed: () {},
          child: const Text("See all",
              style: TextStyle(color: AppColors.secondaryColor)),
        )
      ],
    );
  }
}
