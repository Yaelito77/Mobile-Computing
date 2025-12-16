import 'package:flutter/material.dart';
import '../models/todo_item.dart';

// Widget que representa un Todo en la lista
class TodoListTile extends StatelessWidget {
  // Todo que se va a mostrar
  final TodoItem todo;

  // Acción al marcar/desmarcar el Todo
  final ValueChanged<bool?> onChanged;

  // Acción para editar el Todo
  final VoidCallback onEdit;

  // Acción para eliminar el Todo
  final VoidCallback onDelete;

  const TodoListTile({
    super.key,
    required this.todo,
    required this.onChanged,
    required this.onEdit,
    required this.onDelete,
  });

  // Formatea la fecha para mostrarla en pantalla
  String _formatDate(DateTime? date) {
    if (date == null) return 'Sin fecha';
    return date.toLocal().toString().split(' ')[0];
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: todo.isDone,
        onChanged: onChanged,
      ),
      title: Text(
        todo.title,
        style: TextStyle(
          decoration:
          todo.isDone ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      subtitle: Text('Fecha objetivo: ${_formatDate(todo.dueDate)}'),
      // Tocar el tile permite editar el Todo
      onTap: onEdit,
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: onDelete,
      ),
    );
  }
}
