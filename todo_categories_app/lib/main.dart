import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/todo_provider.dart';
import 'screens/category_list_screen.dart';

// Punto de entrada de la aplicación
void main() {
  runApp(const TodoApp());
}

// Widget raíz de la aplicación
class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // Proveedor global del estado de la app
      create: (_) => TodoProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todo Categories App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        ),
        // Pantalla inicial de la app
        home: const CategoryListScreen(),
      ),
    );
  }
}
