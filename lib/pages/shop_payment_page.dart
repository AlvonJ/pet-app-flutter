import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_app/models/app_colors.dart';
import 'package:pet_app/provider/shop_provider.dart';
import 'package:pet_app/widgets/deliver_location.dart';
import 'package:pet_app/widgets/payment_item.dart';

class ShopPaymentPage extends ConsumerStatefulWidget {
  const ShopPaymentPage({super.key});

  @override
  ConsumerState<ShopPaymentPage> createState() => _ShopPaymentPageState();
}

class _ShopPaymentPageState extends ConsumerState<ShopPaymentPage> {
  int number = 1;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    //riverpod
    final carts = ref.watch(cartNotifierProvider);
    for (var e in carts.cart) {
      log('${e.title}');
    }
    

    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("./assets/template.png"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: AppColors.secondaryColor),
          title: const Text("Payment "),
          titleTextStyle: const TextStyle(
              color: AppColors.mainColor,
              fontWeight: FontWeight.bold,
              fontSize: 26,
              letterSpacing: .5),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  SizedBox(
                    width: 6,
                  ),
                ],
              ),
            ),
          ],
        ),
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(children: [
            Positioned(
                child: Container(
              height: 360,
              width: mediaQuery.size.width,
              child: ListView(
                children: [
                  Column(
                    children: [
                      const DeliverLocation(),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(
                          children: const [
                            Text(
                              "3",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.mainColor),
                            ),
                            Text(
                              " Items",
                              style: TextStyle(
                                  fontSize: 13, color: AppColors.mainColor),
                            )
                          ],
                        ),
                      ),
                      const PaymentItem(
                          pathImage: 'assets/shop/box.png',
                          title: "Pedigree Adult Meal",
                          price: 120000,
                          amount: 2),
                      const PaymentItem(
                          pathImage: 'assets/shop/can.png',
                          title: "Puppy Meal",
                          price: 80000,
                          amount: 1),
                      const SizedBox(height: 20)
                    ],
                  ),
                ],
              ),
            )),
            Positioned(
              left: -5,
              top: 370,
              child: Container(
                width: mediaQuery.size.width + 10,
                height: mediaQuery.size.height,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border.all(width: 0.6, color: AppColors.secondaryColor),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    image: const DecorationImage(
                        image: AssetImage('./assets/template.png'),
                        alignment: Alignment.bottomRight)),
                child: Column(
                  children: [
                    Container(
                      width: double.maxFinite,
                      height: 460,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: ListView(
                        children: [
                          const SizedBox(height: 25),
                          Row(
                            children: const [
                              Text('3 Items',
                                  style: TextStyle(
                                      color: AppColors.mainColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              Spacer(),
                              Text("Rp 200000",
                                  style: TextStyle(
                                      color: AppColors.mainColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: const [
                              Text('Delivery',
                                  style: TextStyle(
                                      color: AppColors.mainColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400)),
                              Spacer(),
                              Text("Rp 10000",
                                  style: TextStyle(
                                      color: AppColors.mainColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          const SizedBox(height: 25),
                          Row(
                            children: const [
                              Text('Total',
                                  style: TextStyle(
                                      color: AppColors.mainColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              Spacer(),
                              Text("Rp 210000",
                                  style: TextStyle(
                                      color: AppColors.mainColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          const SizedBox(height: 25),
                          Column(
                            children: const [],
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                left: (mediaQuery.size.width / 2) - 25,
                top: 380,
                width: 50,
                height: 3,
                child: Container(
                  decoration: const BoxDecoration(color: Colors.grey),
                )),
            Positioned(
                bottom: 100,
                left: 20,
                child: SizedBox(
                  width: mediaQuery.size.width - 40,
                  child: Container(
                    width: 300,
                    height: 32,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColors.mainColor, width: 2),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(width: 5),
                        const Text(
                          "Payment Method",
                          style: TextStyle(
                              fontSize: 10,
                              color: AppColors.mainColor,
                              fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        const Text(
                          "BCA",
                          style: TextStyle(
                              fontSize: 12,
                              color: AppColors.mainColor,
                              fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                            onPressed: () {
                              setState(() {});
                            },
                            child: const Text("change",
                                style: TextStyle(
                                    fontSize: 9,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.secondaryColor))),
                      ],
                    ),
                  ),
                )),
            Positioned(
              bottom: 20,
              left: 55,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 90, vertical: 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)),
                      backgroundColor: AppColors.secondaryColor),
                  onPressed: () {},
                  child: const Text(
                    "Check Out",
                    style: TextStyle(fontSize: 18),
                  )),
            )
          ]),
        ),
      ),
    );
  }
}
