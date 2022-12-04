import 'package:flutter/material.dart';

class CardAdoptionItem extends StatelessWidget {
  final String category;
  final String value;

  const CardAdoptionItem({
    Key? key,
    required this.category,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.2), spreadRadius: 1, blurRadius: 1)
      ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(children: [
        Text(
          value,
          style: const TextStyle(
              color: Color(0xff827397),
              fontSize: 15,
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 5),
        Text(
          category,
          style: TextStyle(color: Colors.black.withOpacity(0.4), fontSize: 12),
        ),
      ]),
    );
  }
}
