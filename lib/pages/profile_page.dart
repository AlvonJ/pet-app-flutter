import 'package:flutter/material.dart';
import 'package:pet_app/models/app_colors.dart';

class ProfilePage extends StatelessWidget {
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final genderController = TextEditingController();
  final ageController = TextEditingController();

  ProfilePage({super.key});

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
          title: const Text("Profile"),
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
                const CircleAvatar(
                  radius: 45,
                  backgroundImage: AssetImage('./assets/profile/circle.png'),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: AppColors.mainColor),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(10)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.red, width: 1.5),
                        borderRadius: BorderRadius.circular(10)),
                    border: const OutlineInputBorder(),
                    labelText: 'Email',
                    labelStyle: const TextStyle(fontSize: 14),
                  ),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: addressController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: AppColors.mainColor),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(10)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.red, width: 1.5),
                        borderRadius: BorderRadius.circular(10)),
                      border: const OutlineInputBorder(),
                    labelText: 'Address',
                    labelStyle: const TextStyle(fontSize: 14),
                  ),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: genderController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: AppColors.mainColor),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(10)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.red, width: 1.5),
                        borderRadius: BorderRadius.circular(10)),
                    border: const OutlineInputBorder(),
                    labelText: 'Gender',
                    labelStyle: const TextStyle(fontSize: 14),
                  ),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: ageController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: AppColors.mainColor),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(10)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.red, width: 1.5),
                        borderRadius: BorderRadius.circular(10)),
                    border: const OutlineInputBorder(),
                    labelText: 'Age',
                    labelStyle: const TextStyle(fontSize: 14),
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(150, 50),
                            backgroundColor: AppColors.secondaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Text('Save Changes')),
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
