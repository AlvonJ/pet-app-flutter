import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_app/widgets/card_item.dart';
import 'package:pet_app/widgets/list_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("./assets/template.png"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: SvgPicture.asset(
                  './assets/menu.svg',
                  height: 30,
                  width: 30,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                padding: const EdgeInsets.only(left: 20),
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Color(0xff6f00ff)),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
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
                    padding: const EdgeInsets.all(10),
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
                  padding: const EdgeInsets.only(left: 3),
                  child: Row(
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
                    icon: Icons.monetization_on,
                    text: 'Donate',
                    callback: () {}),
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
                    callback: () async {
                      await FirebaseAuth.instance.signOut();
                      context.goNamed('login');
                    })
              ],
            ),
          ),
        ),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                const SizedBox(height: 22),
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
                      child: const Text("See all",
                          style: TextStyle(color: Color(0xff6f00ff))),
                    )
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 350,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      CardItem(
                          pathImage: './assets/dog.png',
                          name: 'Roger',
                          location: "Batununggal (2.5 km)")
                    ],
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
