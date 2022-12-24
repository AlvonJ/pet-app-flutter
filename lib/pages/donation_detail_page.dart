import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_app/models/app_colors.dart';
import 'package:pet_app/widgets/card_adoption_item.dart';
import 'package:pet_app/widgets/progress_bar.dart';

class DonationDetailPage extends StatelessWidget {
  const DonationDetailPage({super.key});

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
                        image: AssetImage('./assets/donation/roger2.png'),
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
                        'Roger',
                        style: TextStyle(
                            color: AppColors.mainColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          CardAdoptionItem(category: "Gender", value: "Male"),
                          CardAdoptionItem(category: "Color", value: "Yellow"),
                          CardAdoptionItem(category: "Breed", value: "Persian"),
                          CardAdoptionItem(category: "Weight", value: "2kg"),
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
                          'Roger diagnosa menderita penurunan fungsi ginjal dan memerlukan biaya pengobatan.',
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
                                '50%',
                                style: TextStyle(color: Colors.black54),
                              ),
                              ProgressBar(
                                  percentage: 50,
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
                                        'Rp 2.500.000',
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
                                        'Rp 5.000.000',
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
                                context.pushNamed('donate-payment');
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
