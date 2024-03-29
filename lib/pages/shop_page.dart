import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_app/models/app_colors.dart';
import 'package:pet_app/provider/shop_provider.dart';
import 'package:pet_app/widgets/bundle.dart';
import 'package:pet_app/widgets/item_shop.dart';
import 'package:pet_app/widgets/search_bar.dart';
import 'package:pet_app/widgets/shop_category.dart';
import 'package:pet_app/widgets/sub_title.dart';

class ShopPage extends ConsumerStatefulWidget {
  const ShopPage({super.key});

  @override
  ConsumerState<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends ConsumerState<ShopPage> {
  // untuk ui page
  List<Map<String, String>> categories = [
    {"title": 'Food', "path": './assets/shop/food.png'},
    {"title": 'Accessories', "path": './assets/shop/accessories.png'},
    {"title": 'Toys', "path": './assets/shop/toy.png'},
  ];

  List widgets = [
    const FoodWidget(),
    const AccessoriesWidget(),
    const ToysWidget(),
  ];

  int current = 0;

  @override
  Widget build(BuildContext context) {
    // provider
    final carts = ref.watch(cartNotifierProvider).total;
    final totals = carts.fold(
      0,
      (previousValue, element) => previousValue + element,
    );

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
                  Stack(
                    children: [
                      IconButton(
                        onPressed: () {
                          if (totals > 0) {
                            context.pushNamed('shop-payment');
                          } else {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.warning,
                              headerAnimationLoop: false,
                              animType: AnimType.bottomSlide,
                              title: 'Cart Empty',
                              desc: 'Please add item to cart',
                              buttonsTextStyle:
                                  const TextStyle(color: Colors.black),
                              showCloseIcon: true,
                              btnOkOnPress: () {},
                            ).show();
                          }
                        },
                        iconSize: 30,
                        icon: const Icon(
                          Icons.shopping_cart_outlined,
                          color: AppColors.secondaryColor,
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Colors.green,
                          ),
                          child: Text(
                            totals.toString(),
                            style: const TextStyle(
                                fontSize: 8, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
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
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        splashColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            current = index;
                          });
                        },
                        child: ShopCategory(
                          title: categories[index]['title'].toString(),
                          path: categories[index]['path'].toString(),
                          selected: index == current ? true : false,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                const SubTitle(title: "Popular Food", size: 20),
                const SizedBox(height: 10),
                widgets[current],
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

class FoodWidget extends ConsumerWidget {
  const FoodWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ItemShop(
            pathImage: 'assets/shop/box.png',
            text: "Pedigree adult meal",
            onTap: () {
              context.goNamed('shop-detail');
              ref.read(shopDetailProvider.notifier).state = {
                'path': 'assets/shop/box.png',
                'text': 'Pedigree adult meal',
                'price': 120000
              };
            },
            price: 120000,
          ),
          ItemShop(
            pathImage: 'assets/shop/can.png',
            text: "Puppy meal",
            onTap: () {
              context.goNamed('shop-detail');
              ref.read(shopDetailProvider.notifier).state = {
                'path': 'assets/shop/can.png',
                'text': 'Puppy meal',
                'price': 40000
              };
            },
            price: 40000,
          ),
        ],
      ),
    );
  }
}

class AccessoriesWidget extends ConsumerWidget {
  const AccessoriesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ItemShop(
            pathImage: 'assets/shop/collar.png',
            text: "Dog Collar",
            onTap: () {
              context.goNamed('shop-detail');
              ref.read(shopDetailProvider.notifier).state = {
                'path': 'assets/shop/collar.png',
                'text': 'Dog Collar',
                'price': 100000
              };
            },
            price: 100000,
          ),
          ItemShop(
            pathImage: 'assets/shop/leash.png',
            text: "Pet Leash",
            onTap: () {
              context.goNamed('shop-detail');
              ref.read(shopDetailProvider.notifier).state = {
                'path': 'assets/shop/leash.png',
                'text': 'Pet Leash',
                'price': 80000
              };
            },
            price: 80000,
          ),
        ],
      ),
    );
  }
}

class ToysWidget extends ConsumerWidget {
  const ToysWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ItemShop(
            pathImage: 'assets/shop/toy1.png',
            text: "Cat's Toy",
            onTap: () {
              context.goNamed('shop-detail');
              ref.read(shopDetailProvider.notifier).state = {
                'path': 'assets/shop/toy1.png',
                'text': "Cat's Toy",
                'price': 50000
              };
            },
            price: 50000,
          ),
          ItemShop(
            pathImage: 'assets/shop/toy2.png',
            text: "Dog's Toy",
            onTap: () {
              context.goNamed('shop-detail');
              ref.read(shopDetailProvider.notifier).state = {
                'path': 'assets/shop/toy2.png',
                'text': "Dog's Toy",
                'price': 40000
              };
            },
            price: 40000,
          ),
        ],
      ),
    );
  }
}
