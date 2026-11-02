import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

class FlutterCampusApp extends StatelessWidget {
  const FlutterCampusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Campus',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.indigo),
      home: const HomeScreen(),
    );
  }
}