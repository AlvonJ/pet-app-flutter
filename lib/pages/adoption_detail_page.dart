import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_app/models/app_colors.dart';
import 'package:pet_app/widgets/card_adoption_item.dart';
import 'package:pet_app/widgets/location_item.dart';

class AdoptionDetailPage extends StatelessWidget {
  final int id;

  AdoptionDetailPage({super.key, required this.id});

  List<Map<String, dynamic>> adoptionDetail = [
    {
      'name': 'Roger',
      'pathImage': './assets/adoption/dog.png',
      'description':
          'Roger adalah anjing hasil rescue yang jinak berusia 8 bulan. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eget faucibus risus. Suspendisse at commodo arcu. Morbi ac dictum odio, eu malesuada augue.',
      'location': 'Batununggal (2.5 km)',
      'gender': 'Male',
      'color': 'Yellow',
      'breed': 'Persian',
      'weight': '2kg'
    },
    {
      'name': 'Samantha',
      'pathImage': './assets/home/cat2.png',
      'description':
          'Samantha adalah kucing hasil rescue yang jinak berusia 2 tahun. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eget faucibus risus. Suspendisse at commodo arcu. Morbi ac dictum odio, eu malesuada augue.',
      'location': 'Pasteur (5 km)',
      'gender': 'Female',
      'color': 'Brown',
      'breed': 'British',
      'weight': '1kg'
    },
    {
      'name': 'Max',
      'pathImage': './assets/adoption/dog2.png',
      'description':
          'Max adalah anjing hasil rescue yang jinak berusia 4 bulan. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eget faucibus risus. Suspendisse at commodo arcu. Morbi ac dictum odio, eu malesuada augue.',
      'location': 'Mekar Rahayu (4 km)',
      'gender': 'Male',
      'color': 'Black',
      'breed': 'Rottweller',
      'weight': '1.5kg'
    },
    {
      'name': 'Billy',
      'pathImage': './assets/adoption/dog5.png',
      'description':
          'Billy adalah anjing hasil rescue yang jinak berusia 2 tahun. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eget faucibus risus. Suspendisse at commodo arcu. Morbi ac dictum odio, eu malesuada augue.',
      'location': 'Dago (10 km)',
      'gender': 'Male',
      'color': 'Black',
      'breed': 'Poodie',
      'weight': '1.2kg'
    },
    {
      'name': 'Milo',
      'pathImage': './assets/adoption/dog4.png',
      'description':
          'Milo adalah anjing hasil rescue yang jinak berusia 3 tahun. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eget faucibus risus. Suspendisse at commodo arcu. Morbi ac dictum odio, eu malesuada augue.',
      'location': 'Pasteur (3 km)',
      'gender': 'Male',
      'color': 'Brown',
      'breed': 'Beagle',
      'weight': '1.8kg'
    },
    {
      'name': 'Daisy',
      'pathImage': './assets/adoption/cat2.png',
      'description':
          'Daisy adalah kucing hasil rescue yang jinak berusia 1 tahun. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eget faucibus risus. Suspendisse at commodo arcu. Morbi ac dictum odio, eu malesuada augue.',
      'location': 'Ciwidey (6 km)',
      'gender': 'Female',
      'color': 'Grey',
      'breed': 'Snowshoe',
      'weight': '1kg'
    },
    {
      'name': 'Tiptoe',
      'pathImage': './assets/adoption/cat3.png',
      'description':
          'Tiptoe adalah kucing hasil rescue yang jinak berusia 2 bulan. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eget faucibus risus. Suspendisse at commodo arcu. Morbi ac dictum odio, eu malesuada augue.',
      'location': 'Margahayu (1 km)',
      'gender': 'Male',
      'color': 'Yellow',
      'breed': 'Calico',
      'weight': '0.5kg'
    },
    {
      'name': 'Peaches',
      'pathImage': './assets/adoption/cat4.png',
      'description':
          'Peaches adalah kucing hasil rescue yang jinak berusia 2 tahun. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eget faucibus risus. Suspendisse at commodo arcu. Morbi ac dictum odio, eu malesuada augue.',
      'location': 'Margahayu (1 km)',
      'gender': 'Female',
      'color': 'White',
      'breed': 'Regdoll',
      'weight': '2kg'
    },
  ];

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
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(adoptionDetail[id]['pathImage']),
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
                          Text(
                            adoptionDetail[id]['name'],
                            style: const TextStyle(
                                color: AppColors.mainColor,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          LocationItem(
                              location: adoptionDetail[id]['location']),
                          const SizedBox(height: 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CardAdoptionItem(
                                  category: "Gender",
                                  value: adoptionDetail[id]['gender']),
                              CardAdoptionItem(
                                  category: "Color",
                                  value: adoptionDetail[id]['color']),
                              CardAdoptionItem(
                                  category: "Breed",
                                  value: adoptionDetail[id]['breed']),
                              CardAdoptionItem(
                                  category: "Weight",
                                  value: adoptionDetail[id]['weight']),
                            ],
                          ),
                          const SizedBox(height: 25),
                          Text(
                            adoptionDetail[id]['description'],
                            style: const TextStyle(fontSize: 14, height: 1.7),
                          ),
                          const SizedBox(height: 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.secondaryColor,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    fixedSize: const Size(280, 60),
                                  ),
                                  onPressed: () {
                                    context.pushNamed('form',
                                        params: {'pet': 'dog', 'id': '0'});
                                  },
                                  child: const Text("Fill Your Form")),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            width: 2,
                                            color: AppColors.secondaryColor),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    fixedSize: const Size(280, 60),
                                  ),
                                  onPressed: () {
                                    AwesomeDialog(
                                      context: context,
                                      animType: AnimType.leftSlide,
                                      headerAnimationLoop: false,
                                      dialogType: DialogType.noHeader,
                                      title: 'Contact Us',
                                      body: Container(
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Contact Us",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22,
                                                  color: AppColors.mainColor),
                                            ),
                                            const Divider(
                                              thickness: 2,
                                              color: AppColors.secondaryColor,
                                            ),
                                            Row(
                                              children: const [
                                                Text(
                                                  "Phone Number",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12,
                                                      color:
                                                          AppColors.mainColor),
                                                ),
                                                Spacer(),
                                                Text(
                                                  "08123456789",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                SizedBox(width: 50),
                                              ],
                                            ),
                                            const SizedBox(height: 5),
                                            Row(
                                              children: const [
                                                Text(
                                                  "Email",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12,
                                                      color:
                                                          AppColors.mainColor),
                                                ),
                                                Spacer(),
                                                Text(
                                                  "pet.care@gmail.com",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 5),
                                            Row(
                                              children: const [
                                                Text(
                                                  "Twitter",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12,
                                                      color:
                                                          AppColors.mainColor),
                                                ),
                                                Spacer(),
                                                Text(
                                                  "@petCareTW",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                SizedBox(width: 50),
                                              ],
                                            ),
                                            const SizedBox(height: 5),
                                            Row(
                                              children: const [
                                                Text(
                                                  "Telegram",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12,
                                                      color:
                                                          AppColors.mainColor),
                                                ),
                                                Spacer(),
                                                Text(
                                                  "@petCareTL",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                SizedBox(width: 55),
                                              ],
                                            ),
                                            const SizedBox(height: 5),
                                            Row(
                                              children: const [
                                                Text(
                                                  "Instagram",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12,
                                                      color:
                                                          AppColors.mainColor),
                                                ),
                                                Spacer(),
                                                Text(
                                                  "@petCareIG",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                SizedBox(width: 55),
                                              ],
                                            ),
                                            const SizedBox(height: 5),
                                          ],
                                        ),
                                      ),
                                      btnOkOnPress: () {},
                                      btnOkColor: AppColors.secondaryColor,
                                      btnOkIcon: Icons.check_circle,
                                    ).show();
                                  },
                                  child: const Text(
                                    "Contact Us",
                                    style: TextStyle(
                                        color: AppColors.secondaryColor,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ],
                          ),
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
                  decoration: BoxDecoration(
                      // color: Colors.white,
                      borderRadius: BorderRadius.circular(6)),
                  child: IconButton(
                    onPressed: () {
                      context.goNamed('adoption');
                    },
                    icon: const Icon(
                      Icons.arrow_back_outlined,
                      color: AppColors.secondaryColor,
                      size: 30,
                    ),
                  ),
                ))
          ]),
        ),
      ),
    );
  }
}
