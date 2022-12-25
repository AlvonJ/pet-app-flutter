import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_app/models/app_colors.dart';
import 'package:pet_app/models/utils.dart';

class DonationPaymentPage extends StatefulWidget {
  const DonationPaymentPage({super.key});

  @override
  State<DonationPaymentPage> createState() => _DonationPaymentPageState();
}

class _DonationPaymentPageState extends State<DonationPaymentPage> {
  List<int> donateValue = [10000, 20000, 50000, 100000, 200000, 500000];
  int selectedDonateIndex = 0;

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
            title: const Text("Payment"),
            titleTextStyle: const TextStyle(
                color: AppColors.mainColor,
                fontWeight: FontWeight.bold,
                fontSize: 26,
                letterSpacing: .5),
            centerTitle: true,
          ),
          body: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(children: [
              Positioned(
                  child: Container(
                height: 360,
                width: mediaQuery.size.width,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 30),
                            Container(
                              width: double.infinity,
                              height: 100,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 8),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        spreadRadius: 1,
                                        blurRadius: 1)
                                  ],
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Roger',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      'Rp 2.500.000',
                                      style: TextStyle(
                                          color: AppColors.mainColor,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Rp 5.000.000',
                                      style: TextStyle(
                                          color: AppColors.secondaryColor,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ]),
                            ),
                            const SizedBox(height: 30),
                            Text(
                              'Amount',
                              style: TextStyle(
                                  color: AppColors.mainColor,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 16),
                          ]),
                    ),
                    Wrap(
                      alignment: WrapAlignment.spaceEvenly,
                      children: List.generate(
                        donateValue.length,
                        (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedDonateIndex = index;
                            });
                          },
                          child: Container(
                            width: 150,
                            height: 50,
                            margin: const EdgeInsets.only(bottom: 15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: selectedDonateIndex == index
                                        ? AppColors.secondaryColor
                                        : AppColors.mainColor,
                                    width: selectedDonateIndex == index
                                        ? 2
                                        : 1.5)),
                            child: Center(
                              child: Text(
                                CurrencyFormat.convertToIdr(
                                    donateValue[index], 0),
                                style: TextStyle(
                                    color: selectedDonateIndex == index
                                        ? AppColors.secondaryColor
                                        : AppColors.mainColor,
                                    fontWeight: selectedDonateIndex == index
                                        ? FontWeight.w600
                                        : FontWeight.w500,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              )),
              Positioned(
                left: -5,
                top: 370,
                child: Container(
                  width: mediaQuery.size.width + 10,
                  height: mediaQuery.size.height,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1, color: AppColors.mainColor),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      image: const DecorationImage(
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
                            const SizedBox(height: 25),
                            Row(
                              children: [
                                const Text('Donation',
                                    style: TextStyle(
                                        color: AppColors.mainColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                const Spacer(),
                                Text(
                                    CurrencyFormat.convertToIdr(
                                        donateValue[selectedDonateIndex], 0),
                                    style: const TextStyle(
                                        color: AppColors.mainColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: const [
                                Text('Fee',
                                    style: TextStyle(
                                        color: AppColors.mainColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                                Spacer(),
                                Text("Rp 1.000",
                                    style: TextStyle(
                                        color: AppColors.mainColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            const SizedBox(height: 25),
                            Row(
                              children: [
                                const Text('Total',
                                    style: TextStyle(
                                        color: AppColors.mainColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                const Spacer(),
                                Text(
                                    CurrencyFormat.convertToIdr(
                                        donateValue[selectedDonateIndex] + 1000,
                                        0),
                                    style: const TextStyle(
                                        color: AppColors.mainColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            const SizedBox(height: 25),
                            Column(
                              children: const [],
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  left: (mediaQuery.size.width / 2) - 25,
                  top: 380,
                  width: 50,
                  height: 3,
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.grey),
                  )),
              Positioned(
                  bottom: 100,
                  left: 20,
                  child: SizedBox(
                    width: mediaQuery.size.width - 40,
                    child: Container(
                      width: 300,
                      height: 32,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: AppColors.mainColor, width: 2),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(width: 5),
                          const Text(
                            "Payment Method",
                            style: TextStyle(
                                fontSize: 10,
                                color: AppColors.mainColor,
                                fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          const Text(
                            "BCA",
                            style: TextStyle(
                                fontSize: 12,
                                color: AppColors.mainColor,
                                fontWeight: FontWeight.bold),
                          ),
                          TextButton(
                              onPressed: () {
                                setState(() {});
                              },
                              child: const Text("change",
                                  style: TextStyle(
                                      fontSize: 9,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.secondaryColor))),
                        ],
                      ),
                    ),
                  )),
              Positioned(
                bottom: 20,
                left: 55,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 90, vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24)),
                        backgroundColor: AppColors.secondaryColor),
                    onPressed: () {
                      AwesomeDialog(
                        context: context,
                        animType: AnimType.leftSlide,
                        headerAnimationLoop: false,
                        dialogType: DialogType.success,
                        showCloseIcon: true,
                        title: 'Success',
                        desc: 'Payment Success',
                        btnOkOnPress: () {
                          setState(() {
                            // context.goNamed('home');
                            context.pop();
                            context.pop();
                          });
                        },
                        btnOkIcon: Icons.check_circle,
                      ).show();
                    },
                    child: const Text(
                      "Check Out",
                      style: TextStyle(fontSize: 18),
                    )),
              )
            ]),
          ),
        ));
  }
}
