import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_app/models/utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                        "Sign In",
                        style: TextStyle(
                            color: Color(0xff4169e1),
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
                                const BorderSide(color: Color(0xff4169E1)),
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
                                  const BorderSide(color: Color(0xff4169E1)),
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
                            color: Color(0xff6f00ff),
                          )),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Container(
                      width: 340,
                      child: const Text(
                        'Forgot Password?',
                        textAlign: TextAlign.end,
                        style:
                            TextStyle(color: Color(0xff6f00ff), fontSize: 12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
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
                                .signInWithEmailAndPassword(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim());

                            Navigator.of(context, rootNavigator: true).pop();

                            context.goNamed('home');
                          } on FirebaseAuthException catch (e) {
                            Navigator.of(context, rootNavigator: true).pop();

                            Utils.showSnackBar(e.message);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor: const Color(0xff4169E1)),
                        child: const Text(
                          "Sign In",
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
                        "Dont have an account? ",
                        style:
                            TextStyle(color: Color(0xff4169E1), fontSize: 14),
                      ),
                      TextButton(
                        onPressed: () {
                          context.goNamed('signUp');
                        },
                        child: const Text(
                          "Sign Up Here",
                          style: TextStyle(
                              color: Color(0xff6f00ff),
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
                                'Or sign In with ',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color(0xff4169E1),
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
                                    backgroundColor: const Color(0xff4169E1),
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
                                      backgroundColor: const Color(0xff4169E1),
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
                                    backgroundColor: const Color(0xff4169E1),
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
                  // sampe sini children column
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
