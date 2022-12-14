import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_app/models/utils.dart';
import 'package:pet_app/pages/adoption_category_page.dart';
import 'package:pet_app/pages/adoption_detail_page.dart';
import 'package:pet_app/pages/adoption_page.dart';
import 'package:pet_app/pages/article_detail_page.dart';
import 'package:pet_app/pages/family_page.dart';
import 'package:pet_app/pages/home_page.dart';
import 'package:pet_app/pages/login_page.dart';
import 'package:pet_app/pages/profile_page.dart';
import 'package:pet_app/pages/shop_detail_page.dart';
import 'package:pet_app/pages/shop_page.dart';
import 'package:pet_app/pages/shop_payment_page.dart';
import 'package:pet_app/pages/sign_up_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final GoRouter router = GoRouter(routes: [
    GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginPage()),
    GoRoute(
      path: '/signUp',
      name: 'signUp',
      builder: (context, state) => const SignUp(),
    ),
    GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
              path: 'family',
              name: 'family',
              builder: (context, state) => const FamilyPage(),
              routes: [
                GoRoute(
                  path: 'article-detail',
                  name: 'article-detail',
                  builder: (context, state) => const ArticleDetailPage(),
                ),
              ]),
          GoRoute(
              path: 'adoption',
              name: 'adoption',
              builder: (context, state) => const AdoptionPage(),
              routes: [
                GoRoute(
                  path: 'detail',
                  name: 'adoption-detail',
                  builder: (context, state) => const AdoptionDetailPage(),
                ),
                GoRoute(
                  path: 'category',
                  name: 'adoption-category',
                  builder: (context, state) => const AdoptionCategoryPage(),
                ),
              ]),
          GoRoute(
              path: 'shop',
              name: 'shop',
              builder: (context, state) => const ShopPage(),
              routes: [
                GoRoute(
                  path: 'shop-detail',
                  name: 'shop-detail',
                  builder: (context, state) => const ShopDetailPage(),
                ),
                GoRoute(
                  path: 'shop-payment',
                  name: 'shop-payment',
                  builder: (context, state) => const ShopPaymentPage(),
                ),
              ]),
          GoRoute(
            path: 'profile',
            name: 'profile',
            builder: (context, state) => ProfilePage(),
          ),
        ]),
  ], initialLocation: '/home/shop/shop-payment');

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
      scaffoldMessengerKey: Utils.messengerKey,
      theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          primaryColor: const Color(0xff4169e1)),
    );
  }
}
