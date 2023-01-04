import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final VoidCallback onTap;
  final String pathImage;
  final String title;
  final String subtitle;
  final String category;

  const NewsCard({
    Key? key,
    required this.onTap,
    required this.pathImage,
    required this.title,
    required this.subtitle,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 2,
                  spreadRadius: 1)
            ]),
        child: Row(children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: 65,
            height: 65,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(pathImage), fit: BoxFit.cover)),
          ),
          const SizedBox(width: 6),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 14),
              )
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category,
                style: const TextStyle(color: Colors.black54),
              ),
            ],
          ),
          const SizedBox(width: 10)
        ]),
      ),
    );
  }
}
