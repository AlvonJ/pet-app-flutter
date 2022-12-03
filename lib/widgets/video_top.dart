import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class VideoTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 360,
        height: 408,
        child: Stack(children: [
          Positioned(
              top: 0,
              left: 0,
              child: Container(
                  width: 360,
                  height: 408,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(217, 217, 217, 1),
                    image: DecorationImage(
                        image: AssetImage('assets/Rectangle44.png'),
                        fit: BoxFit.fitWidth),
                  ))),
          Positioned(
              top: 26.489883422851562,
              left: 29.492385864257812,
              child: Container(
                  width: 22.587156295776367,
                  height: 22.587158203125,
                  child: Stack(children: [
                    Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                            width: 22.587156295776367,
                            height: 22.587158203125,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                            child: Stack(children: []))),
                  ]))),
          Positioned(
              top: 159,
              left: 134,
              child: Container(
                  width: 91,
                  height: 91,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  child: Stack(children: [
                    // Positioned(
                    //   top: 5.6875,
                    //   left: 5.6875,
                    //   child:
                    //   SvgPicture.asset('assets/images/vector.svg',
                    //       semanticsLabel: 'vector'),
                    // ),
                    // Positioned(
                    //     top: 12.44140625,
                    //     left: 12.44140625,
                    //     child: SvgPicture.asset('assets/images/vector.svg',
                    //         semanticsLabel: 'vector')),
                    // Positioned(
                    //   top: 30.656848907470703,
                    //   left: 39.545894622802734,
                    //   child:
                    //   SvgPicture.asset('assets/images/vector.svg',
                    //       semanticsLabel: 'vector'),
                    // ),
                  ]))),
          Positioned(
              top: 38,
              left: 25,
              child: Container(
                  width: 16,
                  height: 16.000001907348633,
                  child: Stack(children: [
                    // Positioned(
                    //   top: 7.999982833862305,
                    //   left: 0,
                    //   child:
                    //   SvgPicture.asset('assets/images/vector.svg',
                    //       semanticsLabel: 'vector'),
                    // ),
                    // Positioned(
                    //   top: 0,
                    //   left: 0,
                    //   child:
                    //   SvgPicture.asset('assets/images/vector.svg',
                    //       semanticsLabel: 'vector'),
                    // ),
                  ]))),
        ]));
  }
}
