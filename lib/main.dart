import 'package:flutter/material.dart';
import 'package:simple_store_app/screens/home_page_screen.dart';
import 'package:simple_store_app/screens/update_product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomePageScreen.id: (context) => const HomePageScreen(),
        UpdateProductScreen.id: (context) => const UpdateProductScreen(),
      },
      initialRoute: HomePageScreen.id,
    );
  }
}
