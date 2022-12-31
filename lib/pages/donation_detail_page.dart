import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_app/models/app_colors.dart';
import 'package:pet_app/widgets/card_adoption_item.dart';
import 'package:pet_app/widgets/progress_bar.dart';

class DonationDetailPage extends StatelessWidget {
  final int id;

  DonationDetailPage({super.key, required this.id});

  List<Map<String, dynamic>> donationDetail = [
    {
      'name': 'Roger',
      'pathImage': './assets/donation/roger2.png',
      'gender': 'Male',
      'color': 'Black',
      'breed': 'Persian',
      'weight': '2kg',
      'description':
          'Roger diagnosa menderita penurunan fungsi ginjal dan memerlukan biaya pengobatan.',
      'min': 'Rp 2.500.000',
      'max': 'Rp 5.000.000',
      'percentage': 50,
    },
    {
      'name': 'Hachi',
      'pathImage': './assets/donation/hachi.png',
      'gender': 'Female',
      'color': 'Brown',
      'breed': 'Shiba Inu',
      'weight': '2kg',
      'description':
          'Hachi diagnosa menderita penurunan fungsi ginjal dan memerlukan biaya pengobatan.',
      'min': 'Rp 3.200.000',
      'max': 'Rp 4.000.000',
      'percentage': 80,
    },
    {
      'name': 'Kit',
      'pathImage': './assets/donation/kit.png',
      'gender': 'Female',
      'color': 'White',
      'breed': 'Angora',
      'weight': '0.6kg',
      'description':
          'Kit diagnosa menderita penurunan fungsi ginjal dan memerlukan biaya pengobatan.',
      'min': 'Rp 2.100.000',
      'max': 'Rp 3.000.000',
      'percentage': 70,
    },
    {
      'name': 'Molly',
      'pathImage': './assets/donation/molly.png',
      'gender': 'Female',
      'color': 'Brown',
      'breed': 'Persian',
      'weight': '1kg',
      'description':
          'Molly diagnosa menderita penurunan fungsi ginjal dan memerlukan biaya pengobatan.',
      'min': 'Rp 100.000',
      'max': 'Rp 1.000.000',
      'percentage': 10,
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
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(donationDetail[id]['pathImage']),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 3,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        donationDetail[id]['name'],
                        style: TextStyle(
                            color: AppColors.mainColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CardAdoptionItem(
                              category: "Gender",
                              value: donationDetail[id]['gender']),
                          CardAdoptionItem(
                              category: "Color",
                              value: donationDetail[id]['color']),
                          CardAdoptionItem(
                              category: "Breed",
                              value: donationDetail[id]['breed']),
                          CardAdoptionItem(
                              category: "Weight",
                              value: donationDetail[id]['weight']),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        height: 120,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 1,
                                spreadRadius: 1,
                              )
                            ]),
                        child: Text(
                          donationDetail[id]['description'],
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.7)),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        height: 90,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 1,
                                spreadRadius: 1,
                              )
                            ]),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '${donationDetail[id]['percentage']}%',
                                style: TextStyle(color: Colors.black54),
                              ),
                              ProgressBar(
                                  percentage: donationDetail[id]['percentage'],
                                  width: mediaQuery.size.width - 40),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black54),
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          child: const Icon(
                                            Icons.attach_money,
                                            color: Colors.black54,
                                            size: 18,
                                          )),
                                      const SizedBox(width: 10),
                                      Text(
                                        donationDetail[id]['min'],
                                        style: const TextStyle(
                                            color: Colors.black54),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black54),
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          child: const Icon(
                                            Icons.attach_money,
                                            color: Colors.black54,
                                            size: 18,
                                          )),
                                      const SizedBox(width: 10),
                                      Text(
                                        donationDetail[id]['max'],
                                        style: const TextStyle(
                                            color: Colors.black54),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ]),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                context.pushNamed('donate-payment', params: {
                                  'id': '$id',
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.secondaryColor,
                                  fixedSize: const Size(240, 50),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30))),
                              child: const Text(
                                'Donate',
                                style: TextStyle(fontSize: 20),
                              )),
                        ],
                      ),
                      const SizedBox(height: 20)
                    ]),
              )
            ],
          ),
        ));
  }
}
