import 'dart:developer';

import 'package:flutter/material.dart';

class WhatsNew extends StatelessWidget {
  final String title;
  final AssetImage asset;

  const WhatsNew({super.key, required this.title, required this.asset});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 306,
        height: 239,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 1,
                  blurRadius: 2)
            ],
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).primaryColor),
        child: Stack(children: [
          Positioned(
              top: 0,
              left: 0,
              child: Container(
                  width: 306,
                  height: 239,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Colors.white,
                  ))),
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
                      color: Color(0xff6f00ff),
                      fontWeight: FontWeight.w700,
                      fontSize: 15),
                ),
              )),
          Positioned(
              top: 0,
              left: 0,
              child: Container(
                  width: 306,
                  height: 172,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    image: DecorationImage(image: asset, fit: BoxFit.fitWidth),
                  ))),
          Positioned(
              top: 209,
              left: 220,
              child: Container(
                  width: 75,
                  height: 17,
                  child: InkWell(
                    onTap: () {
                      log("test");
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
                                  color: Color(0xff6f00ff),
                                )
                              ]))),
                      const Positioned(
                          top: 4,
                          left: 0,
                          child: Text(
                            'Read More',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color(0xff6f00ff),
                              fontSize: 10,
                            ),
                          )),
                    ]),
                  ))),
        ]));
  }
}
