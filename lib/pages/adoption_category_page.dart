import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_app/models/app_colors.dart';
import 'package:pet_app/widgets/search_bar.dart';

import '../widgets/card_animal.dart';

class AdoptionCategoryPage extends StatelessWidget {
  const AdoptionCategoryPage({super.key});

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
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: const IconThemeData(color: AppColors.secondaryColor),
            title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text('Dogs'),
              const SizedBox(width: 10),
              SvgPicture.asset(
                './assets/adoption/emoji-dog.svg',
                width: 40,
              ),
              const SizedBox(
                width: 14,
              )
            ]),
            titleTextStyle: const TextStyle(
                color: AppColors.mainColor,
                fontWeight: FontWeight.bold,
                fontSize: 26,
                letterSpacing: .5),
            centerTitle: true,
          ),
          body: ListView(
            children: [
              Column(children: [
                const SizedBox(height: 26),
                SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                        3,
                        (index) => Container(
                              width: 300,
                              height: 200,
                              margin: EdgeInsets.only(
                                  right: 20, left: index == 0 ? 20 : 0),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          './assets/adoption/slider${index + 1}.png'),
                                      fit: BoxFit.cover)),
                            )),
                  ),
                ),
                const SizedBox(height: 26),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      SearchBar(),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 8,
                    children: [
                      CardAnimal(
                        name: 'Max',
                        pathImage: './assets/adoption/dog2.png',
                        onTap: () => context.goNamed('adoption-detail'),
                      ),
                      CardAnimal(
                        name: 'Roger',
                        pathImage: './assets/adoption/dog3.png',
                        onTap: () => context.goNamed('adoption-detail'),
                      ),
                      CardAnimal(
                        name: 'Billy',
                        pathImage: './assets/adoption/dog2.png',
                        onTap: () => context.goNamed('adoption-detail'),
                      ),
                      CardAnimal(
                        name: 'Milo',
                        onTap: () => context.goNamed('adoption-detail'),
                        pathImage: './assets/adoption/dog4.png',
                      ),
                    ],
                  ),
                )
              ])
            ],
          )),
    );
  }
}
