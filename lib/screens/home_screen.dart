import 'package:flutter/material.dart';

import '../widgets/empty_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis actividades'),
      ),
      body: const EmptyState(
        mensaje: 'Aún no hay actividades',
      ),
    );
  }
}