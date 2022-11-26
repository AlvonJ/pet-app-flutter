import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Test")),
      body: ListView(children: [
        Container(
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
                child: SizedBox(
                  height: 48,
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xff4169E1)),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(10)),
                      border: const OutlineInputBorder(),
                      labelText: 'Email',
                      labelStyle: const TextStyle(fontSize: 14),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 360,
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  height: 46,
                  child: TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xff4169E1)),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.blue, width: 2),
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
              ),
              TextButton(
                onPressed: () {},
                child: Container(
                  width: 340,
                  child: const Text(
                    'Forget Password',
                    textAlign: TextAlign.end,
                    style: TextStyle(color: Color(0xff6f00ff), fontSize: 12),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                  width: 220,
                  height: 46,
                  child: ElevatedButton(
                    onPressed: () {
                      context.goNamed('home');
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
                    style: TextStyle(color: Color(0xff4169E1), fontSize: 14),
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
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
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
                                    borderRadius: BorderRadius.circular(10)),
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
                                      borderRadius: BorderRadius.circular(10)),
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
                                    borderRadius: BorderRadius.circular(10)),
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
        )
      ]),
    );
  }
}
