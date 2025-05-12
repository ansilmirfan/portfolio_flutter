import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/features/presentation/screens/home.dart';
import 'package:portfolio/features/presentation/themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
        physics: BouncingScrollPhysics(),
      ),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData,
      home: Home(),
    );
  }
}
