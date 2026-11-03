import 'package:flutter/material.dart';

import '../models/activity.dart';
import '../services/activity_repository.dart';
import '../widgets/activity_tile.dart';
import '../widgets/empty_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.repo});

  final ActivityRepository repo;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Activity> _items = const [];
  final _favoritos = <String>{};
  bool _cargando = true;

  @override
  void initState() {
    super.initState();
    _cargar();
  }

  Future<void> _cargar() async {
    final xs = await widget.repo.obtenerTodas();
    if (!mounted) return;
    setState(() {
      _items = xs;
      _cargando = false;
    });
  }

  void _alternar(Activity a) {
    widget.repo.alternar(a.id);
    final nueva = a.copyWith(completada: !a.completada);
    setState(() => _items = [for (final x in _items) x.id == a.id ? nueva : x]);
  }

  void _favorito(String id) => setState(() {
    if (!_favoritos.remove(id)) _favoritos.add(id);
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis actividades'),
        actions: [
          Badge.count(count: _favoritos.length, child: const Icon(Icons.star)),
        ],
      ),
      body: switch ((_cargando, _items.isEmpty)) {
        (true, _) => const Center(child: CircularProgressIndicator()),
        (_, true) => const EmptyState(mensaje: 'Aún no hay actividades'),
        _ => ListView.builder(
          itemCount: _items.length,
          itemBuilder: (context, i) {
            final a = _items[i];
            return ActivityTile(
              key: ValueKey(a.id),
              actividad: a,
              favorita: _favoritos.contains(a.id),
              onToggle: () => _alternar(a),
              onFavorito: () => _favorito(a.id),
            );
          },
        ),
      },
    );
  }
}
