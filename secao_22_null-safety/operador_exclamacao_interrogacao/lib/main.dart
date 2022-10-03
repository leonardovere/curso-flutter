import 'dart:math';

int? numero = 10;
void main() {
  // Define que mesmo uma variável pode ser nula, afirma que 
  // terá o valor para ser manipulado
  int resultado = numero!;
  print("Resultado é: $resultado");

  print("=" * 40);

  // String? -> Não consegue chamar métodos internos
  // String -> Consegue chamar métodos internos
  String nome = "Leonardo";
  print('$nome possui ${nome.length} caracteres');

  print("=" * 40);

  /**
   * Como utilizar os operadores ? & !
   */
  List<String> lista1 = ['Morango', 'Banana', 'Melão'];
  List<String>? lista2;
  List<String?> lista3 = ['Morango', null, 'Melão'];
  print('lista1: $lista1\nlista2: $lista2\nlista3: $lista3');

  print("=" * 40);

  String valor = lista3.first!;
  print("valor é: $valor");

  print("=" * 40);

  // Operador (?.) -> Analisa o que tem a esquerda, se for nulo, não executa o método interno
  print('Total de itens: ${lista2?.length}');

  print("=" * 40);

  Random? random;
  print("Número aleatório: ${random?.nextInt(10)}");
}
