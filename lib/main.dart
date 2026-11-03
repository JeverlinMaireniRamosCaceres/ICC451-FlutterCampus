import 'package:flutter/material.dart';

import 'app.dart';
import 'services/activity_repository.dart';

void main() {
  final repo = ActivityRepository();
  runApp(FlutterCampusApp(repo: repo));
}
