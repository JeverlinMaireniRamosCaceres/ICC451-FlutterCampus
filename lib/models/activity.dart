enum Categoria {
  tarea('Tarea'),
  examen('Examen'),
  proyecto('Proyecto'),
  lectura('Lectura');

  const Categoria(this.etiqueta);
  final String etiqueta;
}

class Activity {
  const Activity({
    required this.id,
    required this.titulo,
    required this.categoria,
    required this.entrega,
    this.descripcion,
    this.completada = false,
  });

  final String id;
  final String titulo;
  final Categoria categoria;
  final DateTime entrega;
  final String? descripcion;
  final bool completada;

  bool get vencida => !completada && entrega.isBefore(DateTime.now());

  Activity copyWith({bool? completada}) => Activity(
    id: id,
    titulo: titulo,
    categoria: categoria,
    entrega: entrega,
    descripcion: descripcion,
    completada: completada ?? this.completada,
  );
}