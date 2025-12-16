import 'package:flutter/foundation.dart';
import '../models/todo_category.dart';
import '../models/todo_item.dart';

// Provider que maneja el estado de categorías y todos
class TodoProvider with ChangeNotifier {
  // Lista interna de categorías
  final List<TodoCategory> _categories = [];

  // Lista de categorías (solo lectura)
  List<TodoCategory> get categories => List.unmodifiable(_categories);

  // Busca una categoría por su id
  TodoCategory? getCategoryById(String id) {
    try {
      return _categories.firstWhere((c) => c.id == id);
    } catch (_) {
      return null;
    }
  }

  // ---------- CRUD de Categorías ----------

  // Añade una nueva categoría
  void addCategory(String name) {
    final newCategory = TodoCategory(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
    );
    _categories.add(newCategory);
    notifyListeners();
  }

  // Actualiza el nombre de una categoría
  void updateCategory(String id, String newName) {
    final category = getCategoryById(id);
    if (category != null) {
      category.name = newName;
      notifyListeners();
    }
  }

  // Elimina una categoría
  void deleteCategory(String id) {
    _categories.removeWhere((c) => c.id == id);
    notifyListeners();
  }

  // ---------- CRUD de Todos ----------

  // Añade un todo a una categoría
  void addTodo(String categoryId, String title, DateTime? dueDate) {
    final category = getCategoryById(categoryId);
    if (category != null) {
      final todo = TodoItem(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: title,
        dueDate: dueDate,
      );
      category.todos.add(todo);
      notifyListeners();
    }
  }

  // Actualiza un todo existente
  void updateTodo(
      String categoryId,
      String todoId, {
        String? title,
        DateTime? dueDate,
        bool? isDone,
      }) {
    final category = getCategoryById(categoryId);
    if (category == null) return;

    final index = category.todos.indexWhere((t) => t.id == todoId);
    if (index == -1) return;

    final todo = category.todos[index];
    todo.title = title ?? todo.title;
    todo.dueDate = dueDate ?? todo.dueDate;

    if (isDone != null) {
      todo.isDone = isDone;
    }

    notifyListeners();
  }

  // Elimina un todo de una categoría
  void deleteTodo(String categoryId, String todoId) {
    final category = getCategoryById(categoryId);
    if (category == null) return;

    category.todos.removeWhere((t) => t.id == todoId);
    notifyListeners();
  }
}
