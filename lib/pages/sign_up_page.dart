import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
        return const Color(0xff4169E1);
      }
      return const Color(0xff6f00ff);
    }

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
                    "Sign Up",
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
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 360,
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  height: 46,
                  child: TextField(
                    controller: passwordConfirmController,
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
                        labelText: 'Password Confirmation',
                        labelStyle: const TextStyle(fontSize: 14),
                        suffixIcon: const Icon(
                          Icons.remove_red_eye,
                          color: Color(0xff6f00ff),
                        )),
                  ),
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
                          style:
                              TextStyle(color: Color(0xff4169E1), fontSize: 11),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                          onPressed: () {},
                          child: const Text(
                            "Terms & Conditions ",
                            style: TextStyle(
                              color: Color(0xff6f00ff),
                              fontSize: 10,
                            ),
                          ),
                        ),
                        const Text(
                          "and ",
                          style:
                              TextStyle(color: Color(0xff4169E1), fontSize: 12),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                          onPressed: () {},
                          child: const Text(
                            "Privacy & Policy",
                            style: TextStyle(
                              color: Color(0xff6f00ff),
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
                    onPressed: () {
                      context.goNamed('login');
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: const Color(0xff4169E1)),
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
                    style: TextStyle(color: Color(0xff4169E1), fontSize: 14),
                  ),
                  TextButton(
                    onPressed: () {
                      context.goNamed('login');
                    },
                    child: const Text(
                      "Sign In Here",
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
                            'Or sign Up with ',
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
