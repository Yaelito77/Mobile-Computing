import 'package:flutter/material.dart';
import '../models/todo_category.dart';

// Widget que muestra una categoría con su resumen de Todos
class CategoryCard extends StatelessWidget {
  // Categoría que se va a mostrar
  final TodoCategory category;

  // Acciones asociadas a la tarjeta
  final VoidCallback onTap;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const CategoryCard({
    super.key,
    required this.category,
    required this.onTap,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        // Nombre de la categoría
        title: Text(category.name),
        // Resumen de tareas
        subtitle: Text(
          'Total: ${category.totalTodos} '
              'Pendientes: ${category.pendingTodos} '
              'Completados: ${category.completedTodos}',
        ),
        // Navega al detalle de la categoría
        onTap: onTap,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Editar categoría
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: onEdit,
              tooltip: 'Editar categoría',
            ),
            // Eliminar categoría
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: onDelete,
              tooltip: 'Eliminar categoría',
            ),
          ],
        ),
      ),
    );
  }
}
