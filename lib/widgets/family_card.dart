import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_app/models/app_colors.dart';

class FamilyCard extends StatelessWidget {
  final String title;
  final String pathImage;

  const FamilyCard({super.key, required this.title, required this.pathImage});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          width: 345,
          height: 239,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(children: [
            Positioned(
                top: 0,
                left: 0,
                child: Container(
                  width: 345,
                  height: 239,
                )),
            Positioned(
                top: 180,
                left: 17,
                child: SizedBox(
                  width: 115,
                  height: 50,
                  child: Text(
                    title,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 15),
                  ),
                )),
            Positioned(
                top: 0,
                left: 0,
                child: Container(
                    width: 345,
                    height: 172,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      image: DecorationImage(
                          image: AssetImage(pathImage), fit: BoxFit.fitWidth),
                    ))),
            Positioned(
                top: 209,
                left: 260,
                child: Container(
                    width: 75,
                    height: 17,
                    child: InkWell(
                      onTap: () {
                        context.goNamed('article-detail');
                      },
                      child: Stack(children: [
                        Positioned(
                            top: 0,
                            left: 58,
                            child: Container(
                                width: 17,
                                height: 17,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                ),
                                child: Stack(children: const [
                                  Icon(
                                    Icons.chevron_right_rounded,
                                    color: AppColors.secondaryColor,
                                  )
                                ]))),
                        const Positioned(
                            top: 4,
                            left: 0,
                            child: Text(
                              'Read More',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColors.secondaryColor,
                                fontSize: 10,
                              ),
                            )),
                      ]),
                    ))),
          ])),
    );
  }
}
