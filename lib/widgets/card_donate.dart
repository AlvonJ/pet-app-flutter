import 'package:flutter/material.dart';
import 'package:pet_app/widgets/progress_bar.dart';

class CardDonate extends StatelessWidget {
  final String name;
  final String pathImage;
  final int percentage;
  final double width;
  final bool lastCard;

  const CardDonate({
    Key? key,
    required this.name,
    required this.pathImage,
    required this.percentage,
    required this.width,
    this.lastCard = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 300,
      margin: EdgeInsets.only(left: 20, right: lastCard ? 20 : 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 1,
                spreadRadius: 0)
          ]),
      child: Column(children: [
        Container(
          width: 130,
          height: 180,
          margin: const EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(pathImage), fit: BoxFit.cover)),
        ),
        const SizedBox(height: 4),
        Text(
          name,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '$percentage%',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ProgressBar(percentage: percentage, width: width),
        )
      ]),
    );
  }
}
