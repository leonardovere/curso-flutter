import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_aula/controller.dart';
import 'package:mobx_aula/principal.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  /* int _contador = 0;

  void _incrementar() {
    setState(() {
      _contador++;
    });
  } */

  Controller? _controller;
  ReactionDisposer? _reactionDisposer;

  Widget _campoInput(
    String label, {
    required void Function(String valor) onChanged,
  }) {
    return TextField(
      decoration: InputDecoration(labelText: label),
      onChanged: onChanged,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    /**
     * Só pode ser carregado dentro do método didChangeDependencies
     * ou dentro do método Build.
     */
    _controller = Provider.of<Controller>(context);

    _reactionDisposer =
        reaction<bool>((_) => _controller!.usuarioLogado, (usuarioLogado) {
      if (usuarioLogado) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => Principal(),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _reactionDisposer!.reaction.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contador'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /* Padding(
              padding: EdgeInsets.all(16),

              // Verifica se houve uma alteração no valor
              // e irá exibir novamente.
              child: Observer(
                builder: (_) => Text(
                  _controller.contador.toString(),
                  style: TextStyle(
                    fontSize: 80,
                    color: Colors.black,
                  ),
                ),
              ),
            ), */
            Padding(
              padding: EdgeInsets.all(16),
              child: _campoInput(
                'Email',
                onChanged: _controller!.setNome,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: _campoInput(
                'Senha',
                onChanged: _controller!.setSenha,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Observer(
                builder: (_) => Text(
                  _controller!.formularioValido
                      ? 'Formulário válido'
                      : '*Formulário inválido',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Observer(
                builder: (_) => ElevatedButton(
                  onPressed:
                      _controller!.formularioValido ? _controller!.logar : null,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: _controller!.carregando
                        ? CircularProgressIndicator(
                            backgroundColor: Colors.white,
                          )
                        : Text(
                            'Logar',
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
