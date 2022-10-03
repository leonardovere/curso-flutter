class Usuario {
  late String nome;

  void configuraNome(String texto) {
    nome = texto;
  }
}

class Treinador {
  late Time time;
}

class Time {
  late Treinador treinador;
}

int calcularTotalItens() {
  int total = 3;
  print('Total de itens: $total');
  return total;
}

class Carrinho {
  late int totalItens = calcularTotalItens();  
}

void main() {
  // Necessário configurar o nome, ou irá ocorrer um erro de execução
  Usuario usuario = Usuario();
  usuario.configuraNome('Leonardo');
  print('O nome é ${usuario.nome}');

  /// Late com referência circular
  Time time = Time();
  Treinador treinador = Treinador();
  treinador.time = time;
  time.treinador = treinador;

  /// Carregamento lazy (Preguiçoso)
  Carrinho carrinho = Carrinho();
  /// Só executará o método de inicialização da variável, quando for chamado.
  print(carrinho.totalItens);
}
