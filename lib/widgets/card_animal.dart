import 'package:flutter/material.dart';

import '../models/app_colors.dart';

class CardAnimal extends StatelessWidget {
  final String name;
  final String pathImage;
  final VoidCallback onTap;

  const CardAnimal({
    Key? key,
    required this.name,
    required this.pathImage,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 180,
        height: 300,
        margin: const EdgeInsets.only(bottom: 10),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              width: 200,
              height: 160,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  image: DecorationImage(
                      image: AssetImage(pathImage), fit: BoxFit.cover)),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                name,
                style: const TextStyle(
                    color: AppColors.mainColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                style: TextStyle(color: Colors.black87, fontSize: 12),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
