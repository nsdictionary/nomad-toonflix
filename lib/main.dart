import 'dart:io';

import 'package:flutter/material.dart';
import 'package:toonflix/webtoon.dart';
// import 'package:toonflix/ui_challenge.dart';
// import 'package:toonflix/widgets/stateful_test.dart';
// import 'package:toonflix/pomodoro.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..userAgent =
          'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36';
  }
}

void main() {
  // runApp(const UIChallenge());
  // runApp(const StatefulTest());
  // runApp(const Pomodoro());

  HttpOverrides.global = MyHttpOverrides();
  runApp(const Webtoon());
}
