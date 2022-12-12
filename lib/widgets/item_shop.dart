import 'package:flutter/material.dart';
import 'package:pet_app/models/app_colors.dart';

class ItemShop extends StatelessWidget {
  final String pathImage;
  final String text;
  final String price;
  final VoidCallback onTap;

  const ItemShop({
    Key? key,
    required this.pathImage,
    required this.text,
    required this.onTap,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 155,
        height: 250,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          clipBehavior: Clip.antiAlias,
          child: Column(children: [
            Container(
              width: double.maxFinite,
              height: 140,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                      image: AssetImage(pathImage), fit: BoxFit.fitHeight)),
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style: const TextStyle(
                          color: AppColors.mainColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                    Text(
                      price,
                      style: const TextStyle(
                          color: AppColors.mainColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: onTap,
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          backgroundColor: AppColors.secondaryColor),
                      child: const Text(
                        "Add to Cart",
                        style: TextStyle(fontSize: 10),
                      ),
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
