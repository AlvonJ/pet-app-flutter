import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback callback;

  const ListItem(
      {super.key,
      required this.icon,
      required this.text,
      required this.callback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(children: [
        Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        )
      ]),
      onTap: callback,
    );
  }
}
