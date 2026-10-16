import 'dart:io';

// 1. Clase con atributos, constructor y método
class Empleado {
  String nombre;
  double horasLaboradas;
  double tarifaHora;

  Empleado(this.nombre, this.horasLaboradas, this.tarifaHora);

  double calcularTotalDevengado() {
    return horasLaboradas * tarifaHora;
  }
}

void main() {
  // Entrada de datos por teclado
  stdout.write('Ingrese el nombre del empleado: ');
  String nombre = stdin.readLineSync()!;

  stdout.write('Ingrese la cantidad de horas laboradas: ');
  double horas = double.parse(stdin.readLineSync()!);

  stdout.write('Ingrese la tarifa por hora: ');
  double tarifa = double.parse(stdin.readLineSync()!);

  // Crear objeto y calcular
  Empleado emp = Empleado(nombre, horas, tarifa);
  double total = emp.calcularTotalDevengado();

  // Imprimir datos solicitados
  print('\n--- Datos del Empleado ---');
  print('Nombre del empleado: ${emp.nombre}');
  print('Cantidad de horas laboradas: ${emp.horasLaboradas}');
  print('Total devengado: $total');
}
