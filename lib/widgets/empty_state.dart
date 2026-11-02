import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
    required this.mensaje,
  });

  final String mensaje;

  @override
  Widget build(BuildContext context) {
    final estilo = Theme.of(context).textTheme.titleMedium;
    return Center(
      child: Text(mensaje, style: estilo),
    );
  }
}