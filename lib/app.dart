import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'services/activity_repository.dart';

class FlutterCampusApp extends StatelessWidget {
  const FlutterCampusApp({super.key, required this.repo});

  final ActivityRepository repo;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Campus',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.indigo),
      home: HomeScreen(repo: repo),
    );
  }
}
