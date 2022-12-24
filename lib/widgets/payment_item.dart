import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_app/models/app_colors.dart';
import 'package:pet_app/models/utils.dart';
import 'package:pet_app/provider/shop_provider.dart';

class PaymentItem extends ConsumerWidget {
  final index;
  final amount;
  final Product product;
  const PaymentItem({
    super.key,
    required this.index,
    required this.amount,
    required this.product,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: SizedBox(
          width: 330,
          height: 80,
          child: Stack(children: [
            Positioned(
              top: 5,
              right: 5,
              child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  color: Colors.red,
                  onPressed: () {
                    ref.read(cartNotifierProvider).clearProduct(index);
                  },
                  icon: const Icon(Icons.delete_forever_outlined, size: 18)),
            ),
            Positioned(
              top: 9,
              left: 19,
              child: SizedBox(
                width: 300,
                height: 65,
                child: Row(
                  children: [
                    Image(
                      image: AssetImage(product.path),
                      fit: BoxFit.fitHeight,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          product.title,
                          style: const TextStyle(
                              color: AppColors.mainColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          CurrencyFormat.convertToIdr(
                              product.price * amount, 0),
                          style: const TextStyle(
                              color: AppColors.mainColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        IconButton(
                            splashColor: Colors.transparent,
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            color: AppColors.secondaryColor,
                            onPressed: () {
                              if (amount >= 0) {
                                if (amount == 1) {
                                  ref
                                      .read(cartNotifierProvider)
                                      .removeProduct(index);
                                  ref
                                      .read(cartNotifierProvider)
                                      .clearProduct(index);
                                } else {
                                  ref
                                      .read(cartNotifierProvider)
                                      .removeProduct(index);
                                }
                                const snackBar = SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text('Item removed'),
                                );
                                ScaffoldMessenger.of(context)
                                    .removeCurrentSnackBar();
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            },
                            icon: const Icon(Icons.remove, size: 16)),
                        const SizedBox(width: 5),
                        Text(
                          "$amount",
                          style: const TextStyle(
                              color: AppColors.mainColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 5),
                        IconButton(
                            splashColor: Colors.transparent,
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            color: AppColors.secondaryColor,
                            onPressed: () {
                              ref.read(cartNotifierProvider).plusProduct(index);
                              const snackBar = SnackBar(
                                backgroundColor: Colors.green,
                                content: Text('Item added'),
                              );
                              ScaffoldMessenger.of(context)
                                  .removeCurrentSnackBar();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            },
                            icon: const Icon(Icons.add, size: 16)),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ])),
    );
  }
}
