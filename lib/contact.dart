/// Modelo de datos que representa un contacto de la agenda telefónica.
///
/// Rama: `feature/listar` (Aprendiz 2 - creación del modelo `Contacto`).
class Contacto {
  String nombre;
  String telefono;

  Contacto(this.nombre, this.telefono);

  /// Representación legible del contacto usada por el menú.
  @override
  String toString() => '$nombre - $telefono';
}
