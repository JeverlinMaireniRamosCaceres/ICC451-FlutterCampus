import 'package:flutter/material.dart';

import '../models/activity.dart';

class ActivityTile extends StatelessWidget {
  const ActivityTile({
    super.key,
    required this.actividad,
    required this.favorita,
    required this.onToggle,
    required this.onFavorito,
  });

  final Activity actividad;
  final bool favorita;
  final VoidCallback onToggle;
  final VoidCallback onFavorito;

  static const _tachado = TextStyle(decoration: TextDecoration.lineThrough);

  @override
  Widget build(BuildContext context) {
    final a = actividad;
    return ListTile(
      leading: Checkbox(value: a.completada, onChanged: (_) => onToggle()),
      title: Text(a.titulo, style: a.completada ? _tachado : null),
      subtitle: Text(a.categoria.etiqueta),
      trailing: IconButton(
        icon: Icon(favorita ? Icons.star : Icons.star_border),
        tooltip: favorita ? 'Quitar' : 'Favorita',
        onPressed: onFavorito,
      ),
    );
  }
}
