import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_app/models/app_colors.dart';
import 'package:pet_app/provider/shop_provider.dart';

class ShopDetailPage extends ConsumerStatefulWidget {
  const ShopDetailPage({super.key});

  @override
  ConsumerState<ShopDetailPage> createState() => _ShopDetailPageState();
}

class _ShopDetailPageState extends ConsumerState<ShopDetailPage> {
  int number = 1;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("./assets/template.png"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(children: [
            Positioned(
                child: Container(
              width: double.maxFinite,
              height: 350,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('./assets/shop/pedigree_backdrop.png'),
                      fit: BoxFit.cover)),
            )),
            Positioned(
              left: 0,
              top: 320,
              child: Container(
                width: mediaQuery.size.width,
                height: mediaQuery.size.height,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    image: DecorationImage(
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
                          const Text('Pedigree adult meal',
                              style: TextStyle(
                                  color: AppColors.mainColor,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(height: 25),
                          Column(
                            children: const [
                              ExpandText(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam suscipit risus pulvinar, hendrerit nisi quis, vehicula ante. Morbi ut diam elit. Praesent non justo sodales, auctor lacus id, congue massa. Duis ac odio dui. Sed sed egestas metus. Donec hendrerit velit magna. Vivamus elementum, ',
                                textAlign: TextAlign.justify,
                              ),
                            ],
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
                top: 330,
                width: 50,
                height: 3,
                child: Container(
                  decoration: const BoxDecoration(color: Colors.grey),
                )),
            Positioned(
                top: 50,
                left: 10,
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(6)),
                  child: IconButton(
                    onPressed: () {
                      context.goNamed('shop');
                    },
                    icon: const Icon(
                      Icons.arrow_back_outlined,
                      color: AppColors.secondaryColor,
                      size: 30,
                    ),
                  ),
                )),
            Positioned(
                bottom: 100,
                left: 20,
                child: SizedBox(
                  width: mediaQuery.size.width - 40,
                  child: Row(
                    children: [
                      Container(
                        width: 150,
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.mainColor, width: 2),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    if (number > 1) number--;
                                  });
                                },
                                child: const Text(
                                  "-",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                )),
                            Text('$number'),
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    number++;
                                  });
                                },
                                child: const Text("+",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold))),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'Rp ${number * 120000}',
                        style: const TextStyle(
                            color: AppColors.mainColor,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )),
            Positioned(
                bottom: 30,
                right: 20,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)),
                      backgroundColor: AppColors.secondaryColor),
                  onPressed: () {
                    for (var i = 0; i < number; i++) {
                      ref.read(cartNotifierProvider.notifier).addProduct(
                            const Product(
                                title: 'Pedigree adult meal',
                                price: 120000,
                                path: 'assets/shop/box.png'),
                          );
                    }
                    const snackBar = SnackBar(
                      backgroundColor: Colors.green,
                      content: Text('Item(s) Added'),
                    );
                    ScaffoldMessenger.of(context).removeCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Row(children: const [
                    Icon(Icons.shopping_cart_outlined),
                    SizedBox(width: 20),
                    Text("Add to cart")
                  ]),
                ))
          ]),
        ),
      ),
    );
  }
}
