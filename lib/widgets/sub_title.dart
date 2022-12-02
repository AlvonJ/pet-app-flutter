import 'package:flutter/material.dart';

class SubTitle extends StatelessWidget {
  final String title;
  const SubTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        TextButton(
          onPressed: () {},
          child:
              const Text("See all", style: TextStyle(color: Color(0xff6f00ff))),
        )
      ],
    );
  }
}
