import 'package:flutter/material.dart';
import 'package:pet_app/models/app_colors.dart';

class ShopCategory extends StatefulWidget {
  final String title;
  final String path;
  final bool selected;

  const ShopCategory(
      {super.key,
      required this.title,
      required this.path,
      this.selected = false});

  @override
  ShopCategoryState createState() => ShopCategoryState();
}

class ShopCategoryState extends State<ShopCategory> {
  late bool selected;

  @override
  Widget build(BuildContext context) {
    final hasil = widget.selected;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: widget.selected ? AppColors.mainColor : Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(widget.path), fit: BoxFit.fitWidth),
                  borderRadius:
                      const BorderRadius.all(Radius.elliptical(20, 20)),
                )),
            const SizedBox(width: 1),
            Text(
              widget.title,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 14,
                color: widget.selected ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
