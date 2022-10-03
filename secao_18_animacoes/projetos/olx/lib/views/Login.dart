import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:olx/models/Usuario.dart';
import 'package:olx/widgets/BotaoCustomizado.dart';
import 'package:olx/widgets/InputCustomizado.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Usuario _usuario = Usuario();

  bool _opcao = false;
  String _label = "Entrar";
  String _mensagemErro;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();

  bool _camposValidos() {
    List<String> erros = [];

    _usuario.email = _emailController.text;
    _usuario.senha = _senhaController.text;

    if (_usuario.email.isEmpty) {
      erros.add("E-mail não pode ser vazio");
    } else if (!_usuario.email.contains("@")) {
      erros.add("Não é um e-mail válido");
    }

    if (_usuario.senha.isEmpty) {
      erros.add("Senha não pode ser vazia");
    } else if (_usuario.senha.length <= 5) {
      erros.add("Senha deve ter no mínimo 6 caracteres");
    }

    if (erros.isNotEmpty) {
      setState(() {
        _mensagemErro = erros.join("\n");
      });

      return false;
    } else {
      setState(() {
        _mensagemErro = null;
      });
    }

    return true;
  }

  void _logar() {
    if (_camposValidos()) {
      _auth
          .signInWithEmailAndPassword(
        email: _usuario.email,
        password: _usuario.senha,
      )
          .then((_) {
        Navigator.pushReplacementNamed(context, "/");
      }).onError((error, stackTrace) {
        setState(() {
          _mensagemErro = error.toString();
        });
      });
    }
  }

  void _cadastrar() {
    if (_camposValidos()) {
      _auth
          .createUserWithEmailAndPassword(
        email: _usuario.email,
        password: _usuario.senha,
      )
          .then((UserCredential userCredential) {
        _usuario.idUsuario = userCredential.user.uid;

        _firestore.collection("usuarios").add(_usuario.toJson()).then((_) {
          Navigator.pushReplacementNamed(context, "/");
        }).onError((error, stackTrace) {
          setState(() {
            _mensagemErro = error.toString();
          });
        });
      }).onError(
        (error, stackTrace) {
          setState(() {
            _mensagemErro = error.toString();
          });
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Image.asset(
                    "assets/images/logo.png",
                    height: 200,
                  ),
                ),
                InputCustomizado(
                  controller: _emailController,
                  hint: "E-mail",
                  autoFocus: true,
                  type: TextInputType.emailAddress,
                ),
                InputCustomizado(
                  controller: _senhaController,
                  obscure: true,
                  hint: "Senha",
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Logar"),
                      Switch(
                        value: _opcao,
                        onChanged: (bool value) {
                          setState(() {
                            _opcao = value;

                            if (_opcao) {
                              _label = 'Cadastrar';
                            } else {
                              _label = 'Entrar';
                            }
                          });
                        },
                      ),
                      Text("Cadastrar"),
                    ],
                  ),
                ),
                BotaoCustomizado(
                  texto: _label,
                  onPressed: _opcao ? _cadastrar : _logar,
                ),
                TextButton(
                  onPressed: () => Navigator.pushReplacementNamed(context, "/"),
                  child: Text('Ir para anúncios'),
                ),
                _mensagemErro == null
                    ? Container()
                    : Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          _mensagemErro,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
