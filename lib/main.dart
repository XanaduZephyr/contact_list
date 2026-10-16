import 'dart:io';

// Aprendiz 2 (rama feature/listar): el modelo ahora vive en lib/contact.dart
import 'contact.dart';

void main() {
  List<Contacto> agenda = [];
  bool ejecutando = true;

  while (ejecutando) {
    print('\n--- Agenda de Contactos ---');
    print('1. Agregar Contacto');
    print('2. Ver Contactos');
    print('3. Buscar Contacto');
    print('4. Eliminar Contacto');
    print('5. Salir');
    stdout.write('Elige una opción: ');

    String? opcion = stdin.readLineSync();

    switch (opcion) {
      case '1':
        // TODO: Aprendiz 1 - Implementar lógica para agregar
        break;
      case '2':
        // Aprendiz 2 - Implementar lógica para listar
        print('\n--- Lista de Contactos ---');
        if (agenda.isEmpty) {
          print('La agenda está vacía. Usa la opción 1 para agregar contactos.');
        } else {
          // Recorrido de la lista con ciclo for (índice + posición en la agenda)
          for (int i = 0; i < agenda.length; i++) {
            print('${i + 1}. ${agenda[i]}');
          }
          print('Total de contactos: ${agenda.length}.');
        }
        break;
      case '3':
        // TODO: Aprendiz 3 - Implementar lógica para buscar
        break;
      case '4':
        // TODO: Aprendiz 3 - Implementar lógica para eliminar
        break;
      case '5':
        print('Saliendo de la agenda...');
        ejecutando = false;
        break;
      default:
        print('Opción no válida. Intenta de nuevo.');
    }
  }
}
