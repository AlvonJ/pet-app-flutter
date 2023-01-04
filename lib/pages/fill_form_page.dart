import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_app/models/app_colors.dart';

class FillForm extends StatefulWidget {
  const FillForm({super.key});

  @override
  State<FillForm> createState() => _FillFormState();
}

class _FillFormState extends State<FillForm> {
  final formKey = GlobalKey<FormState>();

  TextEditingController namaController = TextEditingController();
  TextEditingController ktpController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    // untuk checkbox
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return AppColors.mainColor;
      }
      return AppColors.secondaryColor;
    }

    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("./assets/template.png"), fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme:
              const IconThemeData(color: AppColors.secondaryColor, size: 30),
        ),
        backgroundColor: Colors.transparent,
        body: ListView(children: [
          Container(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Fill Form",
                        style: TextStyle(
                            color: AppColors.mainColor,
                            fontSize: 26,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: 360,
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: namaController,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => value != null && value.length < 6
                          ? 'Enter your Name'
                          : null,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 15),
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
                        labelText: 'Name',
                        labelStyle: const TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                  Container(
                    width: 360,
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: ktpController,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => value != null && value.length < 6
                          ? 'Enter your NIK'
                          : null,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 15),
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
                        labelText: 'NIK',
                        labelStyle: const TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                  Container(
                    width: 360,
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: ageController,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => value != null && value.length < 2
                          ? 'Enter your NIK'
                          : null,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 15),
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
                  ),
                  Container(
                    width: 360,
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: phoneController,
                      textInputAction: TextInputAction.done,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => value != null && value.length < 6
                          ? 'Enter your Phone Number'
                          : null,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 15),
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
                        labelText: 'Phone Number',
                        labelStyle: const TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                  Container(
                    width: 360,
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: addressController,
                      textInputAction: TextInputAction.done,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => value != null && value.length < 6
                          ? 'Enter your Address'
                          : null,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 15),
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
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 360,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                                checkColor: Colors.white,
                                fillColor:
                                    MaterialStateProperty.resolveWith(getColor),
                                value: checked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    checked = value!;
                                  });
                                }),
                            const Text(
                              "I agree to the ",
                              style: TextStyle(
                                  color: AppColors.mainColor, fontSize: 11),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero),
                              onPressed: () {},
                              child: const Text(
                                "Terms & Conditions ",
                                style: TextStyle(
                                  color: AppColors.secondaryColor,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 35),
                  SizedBox(
                      width: 220,
                      height: 46,
                      child: ElevatedButton(
                        onPressed: () {
                          AwesomeDialog(
                            context: context,
                            animType: AnimType.leftSlide,
                            headerAnimationLoop: false,
                            dialogType: DialogType.success,
                            showCloseIcon: true,
                            title: 'Success',
                            desc: 'Form sent! We will contact you soon',
                            btnOkOnPress: () {
                              setState(() {
                                context.pop();
                                context.goNamed('adoption');
                              });
                            },
                            btnOkIcon: Icons.check_circle,
                          ).show();
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor: AppColors.mainColor),
                        child: const Text(
                          "Send Form",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
