import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_app/models/app_colors.dart';
import 'package:pet_app/widgets/card_donate.dart';
import 'package:pet_app/widgets/card_trending_donation.dart';
import 'package:pet_app/widgets/progress_bar.dart';
import 'package:pet_app/widgets/sub_title.dart';

class DonatePage extends StatelessWidget {
  DonatePage({super.key});

  List<Map<String, dynamic>> cardDonate = [
    {
      'name': 'Roger',
      'image': './assets/donation/roger.png',
      'width': 180.0,
      'percentage': 50
    },
    {
      'name': 'Hachi',
      'image': './assets/donation/hachi.png',
      'width': 180.0,
      'percentage': 80
    },
    {
      'name': 'Kit',
      'image': './assets/donation/kit.png',
      'width': 180.0,
      'percentage': 65
    },
  ];

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

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
            title: const Text("Donation"),
            titleTextStyle: const TextStyle(
                color: AppColors.mainColor,
                fontWeight: FontWeight.bold,
                fontSize: 26,
                letterSpacing: .5),
            centerTitle: true,
          ),
          body: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SubTitle(title: 'Top Needs', size: 20),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 300,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 1),
                  itemCount: cardDonate.length,
                  itemBuilder: (context, index) => CardDonate(
                    name: cardDonate[index]['name'],
                    pathImage: cardDonate[index]['image'],
                    percentage: cardDonate[index]['percentage'],
                    width: cardDonate[index]['width'],
                    lastCard: index == cardDonate.length - 1 ? true : false,
                  ),
                  scrollDirection: Axis.horizontal,
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Trending Donation',
                      style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    CardTrendingDonation(
                      name: 'Roger',
                      pathImage: './assets/donation/roger.png',
                      amount: '5.000.000',
                      percentage: 50,
                      mediaQuery: mediaQuery,
                      onTap: () {
                        context.pushNamed('donate-detail');
                      },
                    ),
                    const SizedBox(height: 14),
                    CardTrendingDonation(
                      name: 'Hachi',
                      pathImage: './assets/donation/hachi.png',
                      amount: '4.000.000',
                      percentage: 80,
                      mediaQuery: mediaQuery,
                      onTap: () {
                        context.pushNamed('donate-detail');
                      },
                    ),
                    const SizedBox(height: 14),
                    CardTrendingDonation(
                      name: 'Kit',
                      pathImage: './assets/donation/kit.png',
                      amount: '3.000.000',
                      percentage: 70,
                      mediaQuery: mediaQuery,
                      onTap: () {
                        context.pushNamed('donate-detail');
                      },
                    ),
                    const SizedBox(height: 14),
                    CardTrendingDonation(
                      name: 'Molly',
                      pathImage: './assets/donation/molly.png',
                      amount: '1.000.000',
                      percentage: 10,
                      mediaQuery: mediaQuery,
                      onTap: () {
                        context.pushNamed('donate-detail');
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20)
            ],
          ),
        ));
  }
}
