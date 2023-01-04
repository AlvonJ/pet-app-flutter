import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_app/widgets/news_card.dart';
import 'package:pet_app/widgets/search_bar.dart';

import '../models/app_colors.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

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
          title: const Text("News"),
          titleTextStyle: const TextStyle(
              color: AppColors.mainColor,
              fontWeight: FontWeight.bold,
              fontSize: 26,
              letterSpacing: .5),
          centerTitle: true,
        ),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 20),
                const SearchBar(),
                const SizedBox(height: 30),
                NewsCard(
                    onTap: () {
                      context.pushNamed('family');
                    },
                    pathImage: './assets/news/dog.png',
                    title: 'Cara adopsi anjing',
                    subtitle: 'Tips untuk adopsi anjing',
                    category: 'Article'),
                const SizedBox(height: 10),
                NewsCard(
                    onTap: () {},
                    pathImage: './assets/news/donate.png',
                    title: 'Donasi yayasan kami',
                    subtitle: 'Total donasi kami',
                    category: 'News'),
                const SizedBox(height: 10),
                NewsCard(
                    onTap: () {
                      context.pushNamed('family');
                    },
                    pathImage: './assets/news/cat.png',
                    title: 'Cara adopsi kucing',
                    subtitle: 'Tips untuk donasi kucing',
                    category: 'Article'),
                const SizedBox(height: 10),
                NewsCard(
                    onTap: () {
                      context.pushNamed('family');
                    },
                    pathImage: './assets/article/high_five.png',
                    title: 'Animal Fest 23 Pascal',
                    subtitle: 'Mari datang ke acara ini',
                    category: 'Article'),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
