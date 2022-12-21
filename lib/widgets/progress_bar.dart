import 'package:flutter/material.dart';

import '../models/app_colors.dart';

class ProgressBar extends StatelessWidget {
  final int percentage;
  final double width;

  const ProgressBar({super.key, required this.percentage, required this.width});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: width,
          height: 16,
          decoration: BoxDecoration(
              color: const Color(0xff989898),
              borderRadius: BorderRadius.circular(20)),
        ),
        Container(
          width: width * (percentage / 100),
          height: 16,
          decoration: BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: BorderRadius.circular(20)),
        ),
      ],
    );
  }
}
