import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_app/models/app_colors.dart';
import 'package:pet_app/widgets/card_adoption_item.dart';
import 'package:pet_app/widgets/location_item.dart';

class AdoptionDetailPage extends StatelessWidget {
  const AdoptionDetailPage({super.key});

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
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('./assets/adoption/dog.png'),
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
                          const Text(
                            'Roger',
                            style: TextStyle(
                                color: AppColors.mainColor,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          const LocationItem(location: "Pasteur (5 km)"),
                          const SizedBox(height: 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              CardAdoptionItem(
                                  category: "Gender", value: "Male"),
                              CardAdoptionItem(
                                  category: "Color", value: "Yellow"),
                              CardAdoptionItem(
                                  category: "Breed", value: "Persian"),
                              CardAdoptionItem(
                                  category: "Weight", value: "2kg"),
                            ],
                          ),
                          const SizedBox(height: 25),
                          const Text(
                            "Roger adalah anjing hasil rescue yang jinak berusia 8 bulan. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eget faucibus risus. Suspendisse at commodo arcu. Morbi ac dictum odio, eu malesuada augue. ",
                            style: TextStyle(fontSize: 14, height: 1.7),
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
                                  onPressed: () {},
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
                                  onPressed: () {},
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
