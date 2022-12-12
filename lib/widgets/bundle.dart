import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:pet_app/models/app_colors.dart';

class Bundle extends StatelessWidget {
  const Bundle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 333,
        height: 148,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: const Offset(0, 1),
                blurRadius: 3)
          ],
          color: Colors.white,
        ),
        child: Stack(children: [
          Positioned(
              top: 7,
              left: 64,
              child: Container(
                  width: 88,
                  height: 102,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/shop/Image4.png'),
                        fit: BoxFit.fitWidth),
                  ))),
          const Positioned(
              top: 24,
              left: 171,
              child: Text(
                'Dog Package',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    height: 1),
              )),
          const Positioned(
              top: 108,
              left: 171,
              child: Text(
                'Rp 1.000.000',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )),
          Positioned(
              top: 15,
              child: Transform.rotate(
                angle: (math.pi) * -0.05,
                child: Container(
                    width: 92,
                    height: 132,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/shop/Image3.png'),
                          fit: BoxFit.fitWidth),
                    )),
              )),
          const Positioned(
              top: 52,
              left: 172,
              child: SizedBox(
                width: 200,
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ipsum interdum.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    overflow: TextOverflow.clip,
                  ),
                ),
              )),
        ]));
  }
}
