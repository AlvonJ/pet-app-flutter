import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_app/models/app_colors.dart';
import 'package:pet_app/widgets/card_category.dart';
import 'package:pet_app/widgets/card_item.dart';
import 'package:pet_app/widgets/donate_here.dart';
import 'package:pet_app/widgets/list_item.dart';
import 'package:pet_app/widgets/search_bar.dart';
import 'package:pet_app/widgets/sub_title.dart';

class AdoptionPage extends StatelessWidget {
  const AdoptionPage({super.key});

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
          title: const Text("Adopt"),
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
                    onPressed: () {},
                    iconSize: 30,
                    icon: const Icon(
                      Icons.notifications_outlined,
                      color: AppColors.secondaryColor,
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey[300]),
                    child: const Icon(Icons.person_outline),
                  )
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
                const SizedBox(height: 20),
                const Text(
                  "Category",
                  style: TextStyle(
                      color: AppColors.mainColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.maxFinite,
                  height: 290,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CardCategory(
                        text: "Dogs",
                        pathImage: './assets/adoption/dog2.png',
                        pathSvg: './assets/adoption/emoji-dog.svg',
                        onTap: () =>
                            context.pushNamed('adoption-category', params: {
                          'pet': 'dog',
                        }),
                      ),
                      const SizedBox(width: 18),
                      CardCategory(
                        text: "Cats",
                        pathImage: './assets/adoption/cat.png',
                        pathSvg: './assets/adoption/emoji-cat.svg',
                        onTap: () =>
                            context.pushNamed('adoption-category', params: {
                          'pet': 'cat',
                        }),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

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
                      SizedBox(width: 15),
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
                const SizedBox(height: 40),

                const DonateHere(),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
