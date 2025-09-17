import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/products_provider.dart';
import 'provider/cart_provider.dart';

import 'screens/splash_screen.dart';
import 'screens/product_detail_screen.dart';
import 'screens/cart_screen.dart'; // ✅ Use relative import

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductsProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shopping App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
        routes: {
          ProductDetailScreen.routeName: (_) => ProductDetailScreen(),
          CartScreen.routeName: (_) => const CartScreen(),
        },
      ),
    );
  }
}
