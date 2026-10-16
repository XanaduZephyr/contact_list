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

/// Lee un número entero desde consola dentro del rango [minimo, maximo].
///
/// Aprendiz 3 (rama `feature/gestion`): se usa para elegir el contacto
/// a eliminar cuando existen varias coincidencias.
int leerEntero(String mensaje, {required int minimo, required int maximo}) {
  while (true) {
    stdout.write(mensaje);
    final String? entrada = stdin.readLineSync();
    final int? valor = int.tryParse((entrada ?? '').trim());

    if (valor == null || valor < minimo || valor > maximo) {
      stderr.writeln('Ingresa un número entre $minimo y $maximo.');
      continue;
    }
    return valor;
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
        // Aprendiz 3 - Implementar lógica para buscar
        print('\n--- Buscar Contacto ---');
        final String criterio = leerTexto('Nombre o teléfono a buscar: ');

        // Se recorre toda la lista y se acumulan las coincidencias.
        final List<Contacto> encontrados = <Contacto>[];
        for (final Contacto contacto in agenda) {
          if (contacto.coincideCon(criterio)) {
            encontrados.add(contacto);
          }
        }

        if (encontrados.isEmpty) {
          print('No se encontraron contactos que coincidan con "$criterio".');
        } else {
          print('Se encontraron ${encontrados.length} resultado(s):');
          for (final Contacto contacto in encontrados) {
            print(' - $contacto');
          }
        }
        break;
      case '4':
        // Aprendiz 3 - Implementar lógica para eliminar
        print('\n--- Eliminar Contacto ---');

        if (agenda.isEmpty) {
          print('La agenda está vacía. No hay contactos por eliminar.');
          break;
        }

        final String dato = leerTexto('Nombre o teléfono del contacto: ');

        // Se guardan los índices de todos los contactos que coinciden.
        final List<int> coincidencias = <int>[];
        for (int i = 0; i < agenda.length; i++) {
          if (agenda[i].coincideCon(dato)) {
            coincidencias.add(i);
          }
        }

        if (coincidencias.isEmpty) {
          print('No se encontró ningún contacto con "$dato".');
          break;
        }

        int indiceEliminar = coincidencias.first;

        // Si hay más de una coincidencia, el usuario elige cuál eliminar.
        if (coincidencias.length > 1) {
          print('Se encontraron ${coincidencias.length} coincidencias:');
          for (int i = 0; i < coincidencias.length; i++) {
            print('${i + 1}. ${agenda[coincidencias[i]]}');
          }
          final int seleccion = leerEntero(
            'Número del contacto a eliminar: ',
            minimo: 1,
            maximo: coincidencias.length,
          );
          indiceEliminar = coincidencias[seleccion - 1];
        }

        final Contacto eliminado = agenda.removeAt(indiceEliminar);
        print('Contacto eliminado: $eliminado');
        print('Contactos restantes: ${agenda.length}.');
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
