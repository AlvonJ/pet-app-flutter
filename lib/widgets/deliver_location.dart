import 'package:flutter/material.dart';
import 'package:pet_app/models/app_colors.dart';

class DeliverLocation extends StatelessWidget {
  const DeliverLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: SizedBox(
          width: 330,
          height: 80,
          child: Stack(children: [
            Positioned(
                top: 0,
                left: 0,
                child: Container(
                    width: 330,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      color: Colors.white,
                      border: Border.all(
                        color: AppColors.mainColor,
                        width: 1,
                      ),
                    ))),
            Positioned(
                top: 9,
                left: 19,
                child: Container(
                    width: 180,
                    height: 65,
                    child: Stack(children: const [
                      Positioned(
                        top: 0,
                        left: 1,
                        child: Text(
                          'Deliver To :',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Positioned(
                          top: 45,
                          left: 0,
                          child: Text(
                            'Jl. Kebangsaan Timur No. 56',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.secondaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          )),
                      Positioned(
                          top: 18,
                          left: 0,
                          child: Text(
                            'Home',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.mainColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    ]))),
          ])),
    );
  }
}
