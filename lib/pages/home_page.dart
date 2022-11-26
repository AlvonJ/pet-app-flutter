import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_app/widgets/list_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.remove_red_eye_sharp,
                size: 30,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: const Text("Home Page"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xff6f00ff)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  iconSize: 30,
                  icon: const Icon(
                    Icons.notifications_outlined,
                    color: Color(0xff6f00ff),
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.grey[300]),
                  child: Icon(Icons.person_outline),
                )
              ],
            ),
          ),
        ],
      ),
      drawer: SafeArea(
        child: Drawer(
          backgroundColor: Theme.of(context).primaryColor,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.close_sharp,
                          color: Colors.white,
                          size: 30,
                        )),
                  ],
                ),
              ),
              ListItem(icon: Icons.person, text: 'Profile', callback: () {}),
              ListItem(
                  icon: Icons.pets_outlined, text: 'Adopt', callback: () {}),
              ListItem(
                  icon: Icons.monetization_on, text: 'Donate', callback: () {}),
              ListItem(icon: Icons.people, text: 'Family', callback: () {}),
              ListItem(icon: Icons.newspaper, text: 'News', callback: () {}),
              ListItem(icon: Icons.shopify, text: 'Shop', callback: () {}),
              ListItem(
                  icon: Icons.settings_rounded,
                  text: 'Settings',
                  callback: () {}),
              ListItem(
                  icon: Icons.logout,
                  text: 'Logout',
                  callback: () {
                    context.goNamed('login');
                  })
            ],
          ),
        ),
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     IconButton(
              //       onPressed: () {},
              //       iconSize: 30,
              //       icon: const Icon(
              //         Icons.notifications_outlined,
              //         color: Color(0xff6f00ff),
              //       ),
              //     ),
              //     const SizedBox(
              //       width: 6,
              //     ),
              //     Container(
              //       padding: EdgeInsets.all(10),
              //       decoration: BoxDecoration(
              //           shape: BoxShape.circle, color: Colors.grey[300]),
              //       child: Icon(Icons.person_outline),
              //     )
              //   ],
              // ),
              const SizedBox(
                height: 16,
              ),
              Material(
                elevation: 1,
                borderRadius: BorderRadius.circular(10),
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xff6f00ff))),
                      hintText: "Search..",
                      hintStyle:
                          TextStyle(color: Color(0xff6f00ff), fontSize: 16),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 142,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 1,
                          blurRadius: 2)
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).primaryColor),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      const Text(
                        "We Are Pet Care",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Expanded(
                              child: Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent convallis varius nibh eu vulputate. Nullam dui metus, porta sed libero a, eleifend sodales tellus. Phasellus imperdiet nulla interdum nulla imperdiet finibus. Nullam a cursus tortor. Nunc tincidunt turpis eros, nec aliquet augue luctus at.",
                                style: TextStyle(color: Colors.white),
                                softWrap: false,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Image.asset(
                              'assets/header.png',
                              fit: BoxFit.cover,
                              height: 80,
                            )
                          ]),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 22,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Near You",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text("See all",
                        style: TextStyle(color: Color(0xff6f00ff))),
                  )
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}
