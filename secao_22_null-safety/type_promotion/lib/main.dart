class Usuario {
  String? _nome;

  /* int totalCaracteres() {
    // Type promotion não funciona com atributos de classes
    if (_nome == null) {
      return 0;
    }

    return _nome.length;
  } */
}

void main() {
  String? nome; // Pode receber valor nulo
  nome = "Leonardo"; // Foi provovido para não nulo

  int totalCaracteres(String? nome) {
    /* if (nome == null) {
      return 0;
    } */

    if (nome == null) {
      throw 'Text não pode ser nulo';
    }

    // Nunca chegará uma variável nula
    return nome.length;
  }
}
