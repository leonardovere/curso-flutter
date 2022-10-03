class Anuncio {
  String _id;
  String _estado;
  String _categoria;
  String _titulo;
  String _telefone;
  String _descricao;
  double _preco;
  List<String> _fotos = [];

  Anuncio(
      {String id,
      String estado,
      String categoria,
      String titulo,
      String telefone,
      String descricao,
      double preco,
      List<String> fotos}) {
    this._id = id;
    this._estado = estado;
    this._categoria = categoria;
    this._titulo = titulo;
    this._telefone = telefone;
    this._descricao = descricao;
    this._preco = preco;
    this._fotos = fotos;
  }

  String get id => _id;
  set id(String id) => _id = id;
  String get estado => _estado;
  set estado(String estado) => _estado = estado;
  String get categoria => _categoria;
  set categoria(String categoria) => _categoria = categoria;
  String get titulo => _titulo;
  set titulo(String titulo) => _titulo = titulo;
  String get telefone => _telefone;
  set telefone(String telefone) => _telefone = telefone;
  String get descricao => _descricao;
  set descricao(String descricao) => _descricao = descricao;
  double get preco => _preco;
  set preco(double preco) => _preco = preco;
  List<String> get fotos => _fotos;
  set fotos(List<String> fotos) => _fotos = fotos;

  Anuncio.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _estado = json['estado'];
    _categoria = json['categoria'];
    _titulo = json['titulo'];
    _telefone = json['telefone'];
    _descricao = json['descricao'];
    _preco = json['preco'];
    _fotos = json['fotos'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['estado'] = this._estado;
    data['categoria'] = this._categoria;
    data['titulo'] = this._titulo;
    data['telefone'] = this._telefone;
    data['descricao'] = this._descricao;
    data['preco'] = this._preco;
    data['fotos'] = this._fotos;
    return data;
  }
}
