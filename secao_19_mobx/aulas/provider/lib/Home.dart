import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:observable_list/Principal.dart';
import 'package:observable_list/controller.dart';
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

  late Controller _controller;
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
     * Também é possível chamar o autorun de classes que criam intâncias
     * da controller MobX
     */
    /* autorun((_) {
      print(_controller.formularioValido);
    }); */

    /**
     * Só é possível recuperar um provider dentro do método 
     * didChangeDependecies e do método Build
     */
    _controller = Provider.of(context);

    /**
     * Para monitorar um observavel específico
     */
    _reactionDisposer = reaction(
      // Define qual observavel será monitorado
      (_) => _controller.usuarioLogado,
      // Recebe por parâmetro o observavel monitorado
      (autenticado) {
        if (autenticado as bool) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Principal(),
            ),
          );
        }
      },
    );
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
                onChanged: _controller.setNome,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: _campoInput(
                'Senha',
                onChanged: _controller.setSenha,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Observer(
                builder: (_) => Text(
                  _controller.formularioValido
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
                      _controller.formularioValido ? _controller.logar : null,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: _controller.carregando
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
