import 'package:flutter/material.dart';
// Importa el paquete de Flutter, que contiene widgets y herramientas esenciales para construir interfaces de usuario.

import 'package:flutter_isolate_demo/homa_page.dart';
// Importa el archivo `homa_page.dart`, que probablemente contiene la pantalla principal del proyecto.

void main() {
  // Punto de entrada principal de la aplicación Flutter.
  runApp(const MyApp());
  // Ejecuta la aplicación llamando al widget raíz `MyApp`.
}

class MyApp extends StatelessWidget {
  // Define una clase para el widget raíz de la aplicación.
  const MyApp({super.key});
  // Constructor de `MyApp` que opcionalmente acepta una clave para identificar el widget en el árbol de widgets.

  @override
  Widget build(BuildContext context) {
    // Método para construir la interfaz de usuario del widget.
    return MaterialApp(
      // Define el widget `MaterialApp`, que configura la estructura general de la aplicación.
      
      debugShowCheckedModeBanner: false,
      // Oculta el banner de depuración en la esquina superior derecha de la aplicación.

      title: 'Flutter Demo',
      // Título de la aplicación, utilizado por el sistema operativo para identificar la app.

      theme: ThemeData(
        // Configuración del tema de la aplicación.
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // Genera un esquema de colores basado en un color semilla (en este caso, púrpura oscuro).
        
        useMaterial3: true,
        // Habilita el uso de Material Design 3, la última versión del sistema de diseño de Google.
      ),
      
      home: const HomaPage(),
      // Define la pantalla inicial de la aplicación, que será el widget `HomaPage`.
    );
  }
}