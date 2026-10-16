import 'dart:io';

// 1. Clase para calcular la serie
class SerieFibonacci {
  int limite = 100;

  void generarSerie() {
    int a = 1;
    int b = 1;

    stdout.write('$a $b ');

    int c = a + b;
    while (c <= limite) {
      stdout.write('$c ');
      a = b;
      b = c;
      c = a + b;
    }
    print(''); // Salto de línea final
  }
}

void main() {
  print('Serie hasta 100:');
  SerieFibonacci serie = SerieFibonacci();
  serie.generarSerie();
}
