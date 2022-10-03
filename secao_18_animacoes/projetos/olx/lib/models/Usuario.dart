class Usuario {
  String _idUsuario;
  String _nome;
  String _email;
  String _senha;

  Usuario({String idUsuario, String nome, String email, String senha}) {
    this._idUsuario = idUsuario;
    this._nome = nome;
    this._email = email;
    this._senha = senha;
  }

  String get idUsuario => _idUsuario;
  set idUsuario(String idUsuario) => _idUsuario = idUsuario;
  String get nome => _nome;
  set nome(String nome) => _nome = nome;
  String get email => _email;
  set email(String email) => _email = email;
  String get senha => _senha;
  set senha(String senha) => _senha = senha;

  Usuario.fromJson(Map<String, dynamic> json) {
    _idUsuario = json['idUsuario'];
    _nome = json['nome'];
    _email = json['email'];
    _senha = json['senha'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idUsuario'] = this._idUsuario;
    data['nome'] = this._nome;
    data['email'] = this._email;
    return data;
  }
}
