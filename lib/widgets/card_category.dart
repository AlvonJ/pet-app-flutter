import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_app/models/app_colors.dart';

class CardCategory extends StatelessWidget {
  final String pathImage;
  final String text;
  final String pathSvg;
  final VoidCallback onTap;

  const CardCategory({
    Key? key,
    required this.pathImage,
    required this.text,
    required this.pathSvg,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 250,
        height: 290,
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(children: [
            Container(
              width: double.maxFinite,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8)),
                  image: DecorationImage(
                      image: AssetImage(pathImage), fit: BoxFit.cover)),
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style: const TextStyle(
                          color: AppColors.mainColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    ),
                    const SizedBox(width: 10),
                    SvgPicture.asset(
                      pathSvg,
                      width: 36,
                    )
                  ],
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
