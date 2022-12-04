import 'package:flutter/material.dart';

class LocationItem extends StatelessWidget {
  const LocationItem({
    Key? key,
    required this.location,
  }) : super(key: key);

  final String location;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
