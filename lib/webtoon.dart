import 'package:flutter/material.dart';
import 'package:toonflix/webtoon_screens/home_screen.dart';

class Webtoon extends StatelessWidget {
  const Webtoon({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
