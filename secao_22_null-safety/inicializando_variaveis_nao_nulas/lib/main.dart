/* 1) Inicialização de variáveis */
// Variaveis superiores
int total = 0;

// Campos estáticos
class Pedidos {
  static int total = 0;
}

/* 2) Campos de instância devem ser inicializados
- Inicialização ou Construtor */
class Carrinho {
  int totalItens = 0;
  String item;
  int quantidade;

  Carrinho(this.item, this.quantidade);
}

/* 3) Variáveis locais */
double calcularSalario(double salario) {
  double resultado;

  if (salario > 1000) {
    resultado = salario;
  } else {
    resultado = salario + 100;
  }

  return resultado;
}

void main() {
  // 1) Inicialização da variavel
  total = 10;
  Carrinho carrinho = Carrinho('Capa de Celular', 2);
}
