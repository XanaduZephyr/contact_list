import 'dart:io';

// Aprendiz 2 (rama feature/listar): el modelo ahora vive en lib/contact.dart
import 'contact.dart';

/// Lee una línea de texto desde consola validando que no esté vacía.
///
/// Aprendiz 1 (rama `feature/agregar`): función auxiliar para la
/// entrada de datos del usuario.
String leerTexto(String mensaje) {
  while (true) {
    stdout.write(mensaje);
    final String? entrada = stdin.readLineSync();

    if (entrada == null || entrada.trim().isEmpty) {
      stderr.writeln('El dato no puede estar vacío. Inténtalo de nuevo.');
      continue;
    }
    return entrada.trim();
  }
}

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
        // Aprendiz 1 - Implementar lógica para agregar
        print('\n--- Agregar Contacto ---');
        final String nombre = leerTexto('Nombre del contacto: ');
        final String telefono = leerTexto('Teléfono del contacto: ');

        // Validación: no se permiten teléfonos duplicados en la agenda.
        final bool telefonoRepetido =
            agenda.any((Contacto c) => c.telefono == telefono);

        if (telefonoRepetido) {
          print('Ya existe un contacto con el teléfono $telefono.');
        } else {
          agenda.add(Contacto(nombre, telefono));
          print('Contacto "$nombre" agregado. Total en agenda: ${agenda.length}.');
        }
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
