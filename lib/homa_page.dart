import 'dart:isolate'; 
// Importa el paquete `dart:isolate` para crear y gestionar hilos aislados (isolates), que permiten ejecutar tareas en paralelo.

import 'package:flutter/material.dart'; 
// Importa el paquete de Flutter para construir la interfaz de usuario.

class HomaPage extends StatelessWidget {
  // Define una clase para la pantalla principal de la aplicación.
  const HomaPage({super.key});
  // Constructor que opcionalmente acepta una clave para identificar el widget en el árbol de widgets.

  @override
  Widget build(BuildContext context) {
    // Método para construir la interfaz de usuario del widget.
    return Scaffold(
      // Widget que proporciona la estructura básica de una pantalla con soporte para barras de navegación y cuerpo.
      backgroundColor: Colors.white,
      // Establece el color de fondo de la pantalla a blanco.
      body: SafeArea(
        // Widget que asegura que el contenido no se superponga con áreas como la barra de estado.
        child: Center(
          // Centra el contenido dentro de la pantalla.
          child: Column(
            // Organiza los widgets hijos en una columna vertical.
            children: [
              Image.asset('android/assets/gifs/balls.gif'),
              // Muestra una imagen ubicada en los recursos del proyecto.

              ElevatedButton(
                // Botón elevado para realizar una acción.
                onPressed: () async {
                  // Define la acción que ocurre al presionar el botón.
                  var total = completTask1();
                  // Llama a la función `completTask1` para realizar una tarea de cálculo.
                  debugPrint('Result 1: $total');
                  // Imprime el resultado del cálculo en la consola.
                },
                child: const Text('Task 1'),
                // Texto mostrado en el botón.
              ),

              // --- ISOLATE ---
              ElevatedButton(
                // Botón elevado para realizar una acción utilizando isolates.
                onPressed: () async {
                  final receivePort = ReceivePort();
                  // Crea un `ReceivePort` para recibir mensajes desde el isolate.

                  await Isolate.spawn(complexTask25, receivePort.sendPort);
                  // Inicia un nuevo isolate que ejecutará la función `complexTask25`, pasando el puerto de envío.

                  receivePort.listen((total) {
                    // Escucha los mensajes enviados desde el isolate.
                    debugPrint('Result 2: $total');
                    // Imprime el resultado recibido desde el isolate.
                  });
                },
                child: const Text('Task 2'),
                // Texto mostrado en el botón.
              ),

              // --- ISOLATE con parámetros ---
              ElevatedButton(
                // Botón elevado para realizar una acción utilizando isolates con parámetros.
                onPressed: () async {
                  final receivePort = ReceivePort();
                  // Crea un `ReceivePort` para recibir mensajes desde el isolate.

                  await Isolate.spawn(
                    complexTask3,
                    (iteration: 1000000000, sendPort: receivePort.sendPort),
                  );
                  // Inicia un nuevo isolate que ejecutará la función `complexTask3`, pasando un mapa con los parámetros.

                  receivePort.listen((total) {
                    // Escucha los mensajes enviados desde el isolate.
                    debugPrint('Result 3: $total');
                    // Imprime el resultado recibido desde el isolate.
                  });
                },
                child: const Text('Task 3'),
                // Texto mostrado en el botón.
              ),
            ],
          ),
        ),
      ),
    );
  }

  double completTask1() {
    // Función que realiza una tarea compleja de suma iterativa en el hilo principal.
    var total = 0.0;
    for (var i = 0; i < 1000000000; i++) {
      total += i;
      // Acumula el valor de `i` en `total` durante 1,000,000,000 iteraciones.
    }
    return total;
    // Devuelve el total calculado.
  }
}

// ------ FIN de la clase HomaPage ------

void complexTask25(SendPort sendPort) {
  // Función que realiza una tarea compleja en un isolate.
  var total = 0.0;
  for (var i = 0; i < 100000000; i++) {
    total += i;
    // Acumula el valor de `i` en `total` durante 100,000,000 iteraciones.
  }
  sendPort.send(total);
  // Envía el resultado del cálculo al hilo principal a través del `SendPort`.
}

void complexTask3(({int iteration, SendPort sendPort}) data) {
  // Función que realiza una tarea compleja en un isolate, recibiendo parámetros.
  var total = 0.0;
  for (var i = 0; i < data.iteration; i++) {
    total += i;
    // Acumula el valor de `i` en `total` durante un número de iteraciones especificado en `data.iteration`.
  }
  data.sendPort.send(total);
  // Envía el resultado del cálculo al hilo principal a través del `SendPort`.
}





