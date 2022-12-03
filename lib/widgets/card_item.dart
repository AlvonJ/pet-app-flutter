import 'package:flutter/material.dart';

enum Gender { male, female }

class CardItem extends StatelessWidget {
  final String pathImage;
  final String name;
  final String location;
  final Gender gender;

  const CardItem(
      {super.key,
      required this.pathImage,
      required this.name,
      required this.location,
      required this.gender});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 250,
            width: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(pathImage))),
          ),
          Container(
            width: 300,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.65),
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                    Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: gender == Gender.male
                              ? Theme.of(context).primaryColor.withOpacity(0.3)
                              : Colors.pink.withOpacity(0.3),
                        ),
                        child: gender == Gender.male
                            ? Icon(
                                Icons.male,
                                color: Theme.of(context).primaryColor,
                              )
                            : Icon(
                                Icons.female,
                                color: Colors.pink,
                              ))
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_pin,
                      color: Colors.black.withOpacity(0.5),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      location,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
