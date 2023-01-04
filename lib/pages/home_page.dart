import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_app/models/app_colors.dart';
import 'package:pet_app/provider/shop_provider.dart';
import 'package:pet_app/widgets/card_item.dart';
import 'package:pet_app/widgets/donate_here.dart';
import 'package:pet_app/widgets/list_item.dart';
import 'package:pet_app/widgets/sub_title.dart';
import 'package:pet_app/widgets/card_article.dart';

import '../widgets/search_bar.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: SvgPicture.asset(
                  './assets/menu.svg',
                  height: 30,
                  width: 30,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                padding: const EdgeInsets.only(left: 20),
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: AppColors.secondaryColor),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      context.pushNamed('news');
                    },
                    iconSize: 30,
                    icon: const Icon(
                      Icons.notifications_outlined,
                      color: AppColors.secondaryColor,
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  InkWell(
                    onTap: () {
                      context.pushNamed('profile');
                    },
                    child: const CircleAvatar(
                      radius: 20,
                      backgroundImage:
                          AssetImage('./assets/profile/circle.png'),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        drawer: SafeArea(
          child: Drawer(
            backgroundColor: AppColors.mainColor,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.close_sharp,
                            color: Colors.white,
                            size: 30,
                          )),
                    ],
                  ),
                ),
                // ListItem(
                //     icon: Icons.home,
                //     text: 'Home',
                //     callback: () {
                //       context.goNamed('home');
                //     }),
                ListItem(
                    icon: Icons.person,
                    text: 'Profile',
                    callback: () {
                      Navigator.of(context).pop();
                      context.pushNamed('profile');
                    }),
                ListItem(
                    icon: Icons.pets_outlined,
                    text: 'Adopt',
                    callback: () {
                      Navigator.of(context).pop();
                      context.pushNamed('adoption');
                    }),
                ListItem(
                    icon: Icons.monetization_on,
                    text: 'Donate',
                    callback: () {
                      Navigator.of(context).pop();
                      context.pushNamed('donate');
                    }),
                ListItem(
                    icon: Icons.people,
                    text: 'Family',
                    callback: () {
                      Navigator.of(context).pop();
                      context.pushNamed('family');
                    }),
                ListItem(
                    icon: Icons.newspaper,
                    text: 'News',
                    callback: () {
                      Navigator.of(context).pop();
                      context.pushNamed('news');
                    }),
                ListItem(
                    icon: Icons.shopify,
                    text: 'Shop',
                    callback: () {
                      Navigator.of(context).pop();
                      context.pushNamed('shop');
                    }),
                ListItem(
                    icon: Icons.settings_rounded,
                    text: 'Settings',
                    callback: () {
                      context.pushNamed('setting');
                    }),
                ListItem(
                    icon: Icons.logout,
                    text: 'Logout',
                    callback: () {
                      FirebaseAuth.instance
                          .signOut()
                          .then((_) => context.goNamed('login'));
                    })
              ],
            ),
          ),
        ),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                const SearchBar(),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 142,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 1,
                            blurRadius: 2)
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.mainColor),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        const Text(
                          "We Are Pet Care",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Expanded(
                                child: Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent convallis varius nibh eu vulputate. Nullam dui metus, porta sed libero a, eleifend sodales tellus. Phasellus imperdiet nulla interdum nulla imperdiet finibus. Nullam a cursus tortor. Nunc tincidunt turpis eros, nec aliquet augue luctus at.",
                                  style: TextStyle(color: Colors.white),
                                  softWrap: false,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Image.asset(
                                './assets/home/header.png',
                                fit: BoxFit.cover,
                                height: 80,
                              )
                            ]),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 22),
                const SubTitle(
                  title: "Near You",
                  size: 22,
                ),

                // Near You
                Container(
                  width: double.infinity,
                  height: 350,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CardItem(
                        pathImage: './assets/home/dog.png',
                        name: 'Roger',
                        location: 'Batununggal (2.5 km)',
                        gender: Gender.male,
                        onTap: () {
                          context.goNamed('adoption-detail', params: {
                            'id': '0',
                          });
                        },
                      ),
                      const SizedBox(width: 15),
                      CardItem(
                        pathImage: './assets/home/cat2.png',
                        name: 'Samantha',
                        location: 'Pasteur (5 km)',
                        gender: Gender.female,
                        onTap: () {
                          context.goNamed('adoption-detail', params: {
                            'id': '1',
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                //whats new
                const SubTitle(
                  title: "What's New ?",
                  size: 22,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    InkWell(
                      onTap: () {
                        context.goNamed('article-detail');
                        ref.read(articleProvider.notifier).state = 0;
                      },
                      child: const CardArticle(
                        title: 'How To Adopt a Dog',
                        pathImage: './assets/home/dog_glass.png',
                      ),
                    ),
                    const SizedBox(width: 20),
                    InkWell(
                      onTap: () {
                        context.goNamed('article-detail');
                        ref.read(articleProvider.notifier).state = 1;
                      },
                      child: const CardArticle(
                        title: 'How To Adopt a Cat',
                        pathImage: './assets/home/cat.png',
                      ),
                    ),
                  ]),
                ),
                const SizedBox(height: 50),
                const DonateHere(),
                const SizedBox(height: 33),

                // batas listview
              ],
            ),
          )
        ]),
      ),
    );
  }
}
