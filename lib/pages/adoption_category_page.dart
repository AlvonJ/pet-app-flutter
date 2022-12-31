import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_app/models/app_colors.dart';
import 'package:pet_app/widgets/search_bar.dart';

import '../widgets/card_animal.dart';

class AdoptionCategoryPage extends StatelessWidget {
  final String pet;

  const AdoptionCategoryPage({super.key, required this.pet});

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
              Text(pet == 'dog' ? 'Dogs' : 'Cats'),
              const SizedBox(width: 10),
              SvgPicture.asset(
                pet == 'dog'
                    ? './assets/adoption/emoji-dog.svg'
                    : './assets/adoption/emoji-cat.svg',
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
                                  borderRadius: pet == 'dog'
                                      ? BorderRadius.circular(0)
                                      : BorderRadius.circular(16),
                                  image: DecorationImage(
                                      image: AssetImage(pet == 'dog'
                                          ? './assets/adoption/slider${index + 1}.png'
                                          : './assets/adoption/slider${index + 4}.png'),
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
                pet == 'dog'
                    ? SizedBox(
                        width: double.infinity,
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 8,
                          children: [
                            CardAnimal(
                              name: 'Max',
                              pathImage: './assets/adoption/dog2.png',
                              onTap: () =>
                                  context.goNamed('adoption-detail', params: {
                                'id': '2',
                              }),
                            ),
                            CardAnimal(
                              name: 'Roger',
                              pathImage: './assets/adoption/dog3.png',
                              onTap: () =>
                                  context.goNamed('adoption-detail', params: {
                                'id': '0',
                              }),
                            ),
                            CardAnimal(
                              name: 'Billy',
                              pathImage: './assets/adoption/dog5.png',
                              onTap: () =>
                                  context.goNamed('adoption-detail', params: {
                                'id': '3',
                              }),
                            ),
                            CardAnimal(
                              name: 'Milo',
                              pathImage: './assets/adoption/dog4.png',
                              onTap: () =>
                                  context.goNamed('adoption-detail', params: {
                                'id': '4',
                              }),
                            ),
                          ],
                        ),
                      )
                    : SizedBox(
                        width: double.infinity,
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 8,
                          children: [
                            CardAnimal(
                              name: 'Samantha',
                              pathImage: './assets/home/cat2.png',
                              onTap: () =>
                                  context.goNamed('adoption-detail', params: {
                                'id': '1',
                              }),
                            ),
                            CardAnimal(
                              name: 'Daisy',
                              pathImage: './assets/adoption/cat2.png',
                              onTap: () =>
                                  context.goNamed('adoption-detail', params: {
                                'id': '5',
                              }),
                            ),
                            CardAnimal(
                              name: 'Tiptoe',
                              pathImage: './assets/adoption/cat3.png',
                              onTap: () =>
                                  context.goNamed('adoption-detail', params: {
                                'id': '6',
                              }),
                            ),
                            CardAnimal(
                              name: 'Peaches',
                              pathImage: './assets/adoption/cat4.png',
                              onTap: () =>
                                  context.goNamed('adoption-detail', params: {
                                'id': '7',
                              }),
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
