import 'todo_item.dart';

// Modelo que representa una categoría de tareas
class TodoCategory {
  final String id;

  // Nombre de la categoría
  String name;

  // Lista de tareas asociadas a la categoría
  final List<TodoItem> todos;

  // Constructor de la categoría
  TodoCategory({
    required this.id,
    required this.name,
    List<TodoItem>? todos,
  }) : todos = todos ?? [];

  // Cantidad total de tareas
  int get totalTodos => todos.length;

  // Cantidad de tareas completadas
  int get completedTodos => todos.where((t) => t.isDone).length;

  // Cantidad de tareas pendientes
  int get pendingTodos => todos.where((t) => !t.isDone).length;
}
