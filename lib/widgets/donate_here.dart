import 'package:flutter/material.dart';
import 'package:pet_app/models/app_colors.dart';

class DonateHere extends StatelessWidget {
  const DonateHere({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: 251,
          height: 117,
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
                    width: 251,
                    height: 117,
                    child: Stack(children: [
                      Positioned(
                          top: 72,
                          left: 136,
                          child: Container(
                              width: 28,
                              height: 28,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.elliptical(28, 28)),
                              ))),
                      Positioned(
                          top: 8,
                          left: 20,
                          child: Container(
                              width: 9,
                              height: 9,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.elliptical(8, 8)),
                              ))),
                      Positioned(
                          top: -10,
                          left: 132,
                          child: Container(
                              width: 169,
                              height: 127,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/woof.png'),
                                    fit: BoxFit.fitWidth),
                              ))),
                    ]))),
            Positioned(
                top: 11,
                left: 15,
                child: Container(
                    width: 212,
                    height: 30,
                    child: Stack(children: const [
                      Positioned(
                          top: 0,
                          left: 0,
                          child: Text(
                            'Want To Contribute ?',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 18),
                          )),
                    ]))),
            Positioned(
                top: 50,
                left: 40,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    color: Colors.white,
                    border: Border.all(
                      color: AppColors.secondaryColor,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Donate Here',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: AppColors.secondaryColor, fontSize: 15),
                      ),
                    ),
                  ),
                )),
          ])),
    );
  }
}
