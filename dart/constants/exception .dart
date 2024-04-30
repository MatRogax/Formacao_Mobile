abstract class InvalidExeption {
  String error();
  String toString() => error();
}

class InvalidExeptionNota implements Exception {
  String errorNota() => "Nota inválida";

  @override
  String toString() => errorNota();
}

class InvalidExeptionName implements Exception {
  String errorName() => "Nome inválido";

  @override
  String toString() => errorName();
}