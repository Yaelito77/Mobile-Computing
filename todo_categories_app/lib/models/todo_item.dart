// Modelo que representa una tarea individual
class TodoItem {
  final String id;

  // Texto o descripción de la tarea
  String title;

  // Indica si la tarea está completada
  bool isDone;

  // Fecha objetivo de la tarea (opcional)
  DateTime? dueDate;

  // Constructor del Todo
  TodoItem({
    required this.id,
    required this.title,
    this.isDone = false,
    this.dueDate,
  });
}
