import 'dart:io';

// 1. Clase con atributo, constructor y método de conversión
class Horno {
  double temperaturaCelsius;

  Horno(this.temperaturaCelsius);

  double convertirAFahrenheit() {
    return (temperaturaCelsius * 1.8) + 32;
  }
}

void main() {
  // El usuario digita la temperatura
  stdout.write('Ingrese la temperatura en grados Celsius (°C): ');
  double celsius = double.parse(stdin.readLineSync()!);

  // A través de la clase se asigna y se transforma la temperatura
  Horno horno = Horno(celsius);
  double fahrenheit = horno.convertirAFahrenheit();

  // Imprimir resultado
  print('La temperatura en grados Fahrenheit es: $fahrenheit °F');
}
