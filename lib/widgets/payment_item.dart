import 'package:flutter/material.dart';
import 'package:pet_app/models/app_colors.dart';

class PaymentItem extends StatelessWidget {
  final pathImage;
  final title;
  final price;
  final amount;
  const PaymentItem(
      {super.key,
      required this.pathImage,
      required this.title,
      required this.price,
      required this.amount});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: SizedBox(
          width: 330,
          height: 80,
          child: Stack(children: [
            Positioned(
              top: 9,
              left: 19,
              child: SizedBox(
                width: 300,
                height: 65,
                child: Row(
                  children: [
                    Image(
                      image: AssetImage(pathImage),
                      fit: BoxFit.fitHeight,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              color: AppColors.mainColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Rp ${amount * price}',
                          style: const TextStyle(
                              color: AppColors.mainColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    const Spacer(),
                    Text(
                      "x $amount",
                      style: const TextStyle(
                          color: AppColors.secondaryColor,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ])),
    );
  }
}
