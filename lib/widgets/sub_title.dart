import 'package:flutter/material.dart';
import 'package:pet_app/models/app_colors.dart';

class SubTitle extends StatelessWidget {
  final String title;
  final double size;
  const SubTitle({super.key, required this.title, required this.size});

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
              fontSize: size),
        ),
        TextButton(
          onPressed: () {},
          child: const Text("See all",
              style: TextStyle(color: AppColors.secondaryColor, fontSize: 12)),
        )
      ],
    );
  }
}
