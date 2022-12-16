import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_app/models/app_colors.dart';
import 'package:pet_app/models/utils.dart';
import 'package:pet_app/provider/shop_provider.dart';

class ItemShop extends ConsumerWidget {
  final String pathImage;
  final String text;
  final int price;
  final VoidCallback onTap;

  const ItemShop({
    Key? key,
    required this.pathImage,
    required this.text,
    required this.onTap,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 155,
        height: 270,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          clipBehavior: Clip.antiAlias,
          child: Column(children: [
            Container(
              width: double.maxFinite,
              height: 140,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                      image: AssetImage(pathImage), fit: BoxFit.fitHeight)),
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style: const TextStyle(
                          color: AppColors.mainColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                    Text(
                      CurrencyFormat.convertToIdr(price, 0),
                      style: const TextStyle(
                          color: AppColors.mainColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: () {
                        ref.read(cartNotifierProvider.notifier).addProduct(
                              Product(
                                  title: text, price: price, path: pathImage),
                            );
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          backgroundColor: AppColors.secondaryColor),
                      child: const Text(
                        "Add to Cart",
                        style: TextStyle(fontSize: 10),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
