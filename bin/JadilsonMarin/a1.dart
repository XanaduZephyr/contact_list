import 'dart:io';

// 1. Clase con atributos, constructor y método de cálculo
class Automovil {
  double velocidad;
  double tiempo;

  Automovil(this.velocidad, this.tiempo);

  double calcularDistancia() {
    return velocidad * tiempo;
  }
}

void main() {
  // Entrada de datos por teclado
  stdout.write('Ingrese la velocidad (m/s): ');
  double velocidad = double.parse(stdin.readLineSync()!);

  stdout.write('Ingrese el tiempo (segundos): ');
  double tiempo = double.parse(stdin.readLineSync()!);

  // Crear objeto y calcular
  Automovil auto = Automovil(velocidad, tiempo);
  double distancia = auto.calcularDistancia();

  // Salida por pantalla
  print('La distancia recorrida es: $distancia metros');
}
