import '../models/activity.dart';

class ActivityRepository {
  final _items = <Activity>[
    Activity(
      id: 'a1',
      titulo: 'Parcial de Dart',
      categoria: Categoria.examen,
      entrega: _enDias(3),
    ),
    Activity(
      id: 'a2',
      titulo: 'Lab 2: widgets',
      categoria: Categoria.tarea,
      entrega: _enDias(-1),
    ),
  ];

  static DateTime _enDias(int d) => DateTime.now().add(Duration(days: d));

  Future<List<Activity>> obtenerTodas() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return List.unmodifiable(_items);
  }

  void agregar(Activity a) {
    if (a.titulo.trim().isEmpty) throw ArgumentError('Vacío');
    _items.add(a);
  }

  void alternar(String id) {
    final i = _items.indexWhere((a) => a.id == id);
    if (i == -1) throw StateError('No existe $id');
    _items[i] = _items[i].copyWith(completada: !_items[i].completada);
  }
}