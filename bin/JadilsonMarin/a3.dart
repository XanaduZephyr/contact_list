import 'dart:io';
import 'dart:math';

// 1. Clase con atributos, constructor y cálculo de hipotenusa
class TrianguloRectangulo {
  double ladoA;
  double ladoB;

  TrianguloRectangulo(this.ladoA, this.ladoB);

  double calcularHipotenusa() {
    return sqrt(pow(ladoA, 2) + pow(ladoB, 2));
  }
}

void main() {
  // Entrada de datos por teclado
  stdout.write('Ingrese el lado a: ');
  double ladoA = double.parse(stdin.readLineSync()!);

  stdout.write('Ingrese el lado b: ');
  double ladoB = double.parse(stdin.readLineSync()!);

  // Crear objeto y calcular
  TrianguloRectangulo triangulo = TrianguloRectangulo(ladoA, ladoB);
  double hipotenusa = triangulo.calcularHipotenusa();

  // Imprimir resultado
  print('La hipotenusa es: $hipotenusa');
}
