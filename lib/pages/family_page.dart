import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_app/models/app_colors.dart';
import 'package:pet_app/widgets/family_card.dart';
import 'package:pet_app/widgets/search_bar.dart';

import '../provider/shop_provider.dart';

class FamilyPage extends ConsumerWidget {
  const FamilyPage({super.key});

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
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: AppColors.secondaryColor),
          title: const Text("Family"),
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
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                const SearchBar(),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    context.goNamed('article-detail');
                    ref.read(articleProvider.notifier).state = 0;
                  },
                  child: const FamilyCard(
                    title: 'How To Adopt a Dog',
                    pathImage: './assets/home/dog_glass.png',
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    context.goNamed('article-detail');
                    ref.read(articleProvider.notifier).state = 1;
                  },
                  child: const FamilyCard(
                    title: 'How To Adopt a Cat',
                    pathImage: './assets/home/cat.png',
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    context.goNamed('article-detail');
                    ref.read(articleProvider.notifier).state = 2;
                  },
                  child: const FamilyCard(
                    title: 'Animal Fest 23 Paskal',
                    pathImage: './assets/Rectangle44.png',
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
