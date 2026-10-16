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

  /// Devuelve `true` si el [criterio] coincide parcialmente con el nombre
  /// o con el teléfono del contacto (búsqueda insensible a mayúsculas).
  ///
  /// Aprendiz 3 (rama `feature/gestion`): soporta las opciones 3 y 4.
  bool coincideCon(String criterio) {
    final String patron = criterio.toLowerCase().trim();
    return nombre.toLowerCase().contains(patron) ||
        telefono.toLowerCase().contains(patron);
  }
}
