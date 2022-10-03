/// Parâmetros nomeados por padrão são opcionais
int somar({required int primeiro, int segundo = 0}) {
  return primeiro + segundo;
}

void main() {
  print('A soma é: ${somar(primeiro: 1, segundo: 4)}');
}
