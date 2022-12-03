import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_app/models/app_colors.dart';
import 'package:pet_app/models/utils.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
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
        // appBar: AppBar(title: Text("Test")),
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
                        "Sign Up",
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
                      controller: emailController,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (email) => email != null && email.isEmpty
                          ? 'Please enter an email'
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
                        labelText: 'Email',
                        labelStyle: const TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 360,
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: passwordController,
                      textInputAction: TextInputAction.next,
                      obscureText: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => value != null && value.length < 6
                          ? 'Enter min 6 characters'
                          : null,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 15),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: AppColors.mainColor),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.blue, width: 2),
                              borderRadius: BorderRadius.circular(10)),
                          errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(10)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.red, width: 1.5),
                              borderRadius: BorderRadius.circular(10)),
                          border: const OutlineInputBorder(),
                          labelText: 'Password',
                          labelStyle: const TextStyle(fontSize: 14),
                          suffixIcon: const Icon(
                            Icons.remove_red_eye,
                            color: AppColors.secondaryColor,
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 360,
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: passwordConfirmController,
                      textInputAction: TextInputAction.done,
                      obscureText: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) =>
                          value != null && value != passwordController.text
                              ? 'Confirmation password is not same'
                              : null,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 15),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: AppColors.mainColor),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.blue, width: 2),
                              borderRadius: BorderRadius.circular(10)),
                          errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(10)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.red, width: 1.5),
                              borderRadius: BorderRadius.circular(10)),
                          border: const OutlineInputBorder(),
                          labelText: 'Password Confirmation',
                          labelStyle: const TextStyle(fontSize: 14),
                          suffixIcon: const Icon(
                            Icons.remove_red_eye,
                            color: AppColors.secondaryColor,
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 360,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                            const Text(
                              "and ",
                              style: TextStyle(
                                  color: AppColors.mainColor, fontSize: 12),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero),
                              onPressed: () {},
                              child: const Text(
                                "Privacy & Policy",
                                style: TextStyle(
                                  color: AppColors.secondaryColor,
                                  fontSize: 12,
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
                        onPressed: () async {
                          final isValid = formKey.currentState!.validate();

                          if (!isValid) return;

                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) => Center(
                                      child: CircularProgressIndicator(
                                    color: Theme.of(context).primaryColor,
                                  )));
                          try {
                            await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim());

                            Navigator.of(context, rootNavigator: true).pop();

                            context.goNamed('login');
                          } on FirebaseAuthException catch (e) {
                            Navigator.of(context, rootNavigator: true).pop();

                            Utils.showSnackBar(e.message);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor: AppColors.mainColor),
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account? ",
                        style:
                            TextStyle(color: AppColors.mainColor, fontSize: 14),
                      ),
                      TextButton(
                        onPressed: () {
                          context.goNamed('login');
                        },
                        child: const Text(
                          "Sign In Here",
                          style: TextStyle(
                              color: AppColors.secondaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 38),
                  Container(
                    decoration: const BoxDecoration(),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          decoration: const BoxDecoration(),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 6),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text(
                                'Or sign Up with ',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: AppColors.mainColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          decoration: const BoxDecoration(),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    backgroundColor: AppColors.mainColor,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 20)),
                                onPressed: () {},
                                child: SvgPicture.network(
                                    "https://upload.wikimedia.org/wikipedia/commons/5/53/Google_%22G%22_Logo.svg",
                                    color: Colors.white,
                                    height: 20,
                                    width: 20,
                                    fit: BoxFit.scaleDown),
                              ),
                              const SizedBox(width: 30),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      backgroundColor: AppColors.mainColor,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 20)),
                                  onPressed: () {},
                                  child: SvgPicture.network(
                                      "https://upload.wikimedia.org/wikipedia/commons/1/1b/Apple_logo_grey.svg",
                                      color: Colors.white,
                                      height: 20,
                                      width: 20,
                                      fit: BoxFit.scaleDown)),
                              const SizedBox(width: 30),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    backgroundColor: AppColors.mainColor,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 20)),
                                onPressed: () {},
                                child: SvgPicture.network(
                                    "https://upload.wikimedia.org/wikipedia/commons/4/4f/Twitter-logo.svg",
                                    color: Colors.white,
                                    height: 20,
                                    width: 20,
                                    fit: BoxFit.scaleDown),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
