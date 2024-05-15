import 'package:flutter/material.dart';
import 'package:simple_store_app/screens/home_page_screen.dart';

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
      },
      initialRoute: HomePageScreen.id,
    );
  }
}
