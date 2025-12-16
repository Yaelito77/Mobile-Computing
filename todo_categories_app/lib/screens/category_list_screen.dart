import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/todo_provider.dart';
import '../widgets/category_card.dart';
import 'category_detail_screen.dart';

// Pantalla principal que muestra la lista de categorías
class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key});

  // Diálogo para crear o editar una categoría
  void _showCategoryDialog(
      BuildContext context, {
        String? categoryId,
        String? initialName,
      }) {
    final TextEditingController controller =
    TextEditingController(text: initialName ?? '');

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(
            categoryId == null ? 'Nueva Categoría' : 'Editar Categoría',
          ),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              labelText: 'Nombre de la categoría',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                final name = controller.text.trim();
                if (name.isEmpty) return;

                final provider =
                Provider.of<TodoProvider>(context, listen: false);

                // Si no hay id, crea la categoría. Si no, la actualiza
                if (categoryId == null) {
                  provider.addCategory(name);
                } else {
                  provider.updateCategory(categoryId, name);
                }

                Navigator.of(context).pop();
              },
              child: const Text('Guardar'),
            ),
          ],
        );
      },
    );
  }

  // Confirmación para eliminar una categoría
  void _confirmDeleteCategory(BuildContext context, String categoryId) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Eliminar categoría'),
        content: const Text(
          '¿Estás seguro de eliminar esta categoría y todos sus Todos?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<TodoProvider>(context, listen: false)
                  .deleteCategory(categoryId);
              Navigator.pop(context);
            },
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoProvider>(context);
    final categories = provider.categories;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Listas de Todos'),
      ),
      body: categories.isEmpty
          ? const Center(
        child: Text(
          'No hay categorías aún. Agrega una con el botón +',
        ),
      )
          : ListView.builder(
        itemCount: categories.length,
        itemBuilder: (ctx, index) {
          final category = categories[index];

          return CategoryCard(
            category: category,
            // Navega al detalle de la categoría
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CategoryDetailScreen(
                    categoryId: category.id,
                  ),
                ),
              );
            },
            // Edita la categoría
            onEdit: () {
              _showCategoryDialog(
                context,
                categoryId: category.id,
                initialName: category.name,
              );
            },
            // Elimina la categoría
            onDelete: () {
              _confirmDeleteCategory(context, category.id);
            },
          );
        },
      ),
      // Botón para crear una nueva categoría
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCategoryDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
