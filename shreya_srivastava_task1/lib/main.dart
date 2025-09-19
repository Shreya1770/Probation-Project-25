import 'package:flutter/material.dart';
import 'package:shopping_app/pages/into_pages.dart';
import 'pages/cart_page.dart';

import 'pages/shop_page.dart';
import 'themes/light_mode.dart'; // ✅ adjust the path



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: const Intropage(),
      theme:lightmode,
      routes: {

        '/intro_page':(context) =>const Intropage(),
        '/shop_page':(context) =>const ShopPage(),
        '/cart_page':(context) =>const CartPage(),
      },
    );
  }
}
    