/// Lista pode ser nula? Não
/// Item pode ser nulo? Não
List<String> nomes = [];

/// Lista pode ser nula? Sim
/// Item pode ser nulo? Não
List<String>? nomes2;

/// Lista pode ser nula? Não
/// Item pode ser nulo? Sim
List<String?> nomes3 = ['Maria', null, 'Paulo'];

/// Lista pode ser nula? Sim
/// Item pode ser nulo? Sim
List<String?>? nomes4;

/// Map pode ser nulo? Não
/// Item podeser nulo? Não
Map<String, int> map1 = {};

/// Map pode ser nulo? Sim
/// Item podeser nulo? Não
Map<String, int>? map2;

/// Map pode ser nulo? Não
/// Item podeser nulo? Sim
Map<String, dynamic?> map3 = {'Data atual': null};

/// Map pode ser nulo? Sim
/// Item podeser nulo? Sim
Map<String, dynamic?>? map4;

/// Exemplo de maps
Map<String, String> estados = {'PR': 'Paraná', 'RS': 'Rio Grande do Sul'};

void main() {

  // uma pesquisa por uma chave em um map pode retornar nulo
  // uma vez que a chave procurada pode não estar dentro do map
  String valor = estados['PR']!;
  print(valor);
}
