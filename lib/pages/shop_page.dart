import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_app/models/app_colors.dart';
import 'package:pet_app/widgets/bundle.dart';
import 'package:pet_app/widgets/item_shop.dart';
import 'package:pet_app/widgets/search_bar.dart';
import 'package:pet_app/widgets/shop_category.dart';
import 'package:pet_app/widgets/sub_title.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage("./assets/template.png"),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: AppColors.secondaryColor),
          title: const Text("Shop"),
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
                children: [
                  IconButton(
                    onPressed: () {
                      context.pushNamed('shop-payment');
                    },
                    iconSize: 30,
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                      color: AppColors.secondaryColor,
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                ],
              ),
            ),
          ],
        ),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                const SearchBar(),
                const SizedBox(height: 16),
                Row(
                  children: const [
                    ShopCategory(
                      title: 'Food',
                      path: './assets/shop/food.png',
                      selected: true,
                    ),
                    ShopCategory(
                      title: 'Accessories',
                      path: './assets/shop/accessories.png',
                    ),
                    ShopCategory(
                      title: 'Toys',
                      path: './assets/shop/toy.png',
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const SubTitle(title: "Popular Food", size: 20),
                const SizedBox(height: 10),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ItemShop(
                        pathImage: 'assets/shop/box.png',
                        text: "Pedigree meal",
                        onTap: () {
                          context.goNamed('shop-detail');
                        },
                        price: 'Rp 120.000',
                      ),
                      ItemShop(
                        pathImage: 'assets/shop/can.png',
                        text: "Puppy meal",
                        onTap: () {
                          context.goNamed('shop-detail');
                        },
                        price: 'Rp 40.000',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const SubTitle(title: "Buy In Bundle", size: 20),
                const SizedBox(height: 10),
                const Bundle(),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
