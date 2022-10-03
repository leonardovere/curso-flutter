import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_aula/controller.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  late Controller _controller;

  Widget _getInput(
    TextEditingController controller, {
    required String label,
    required void Function(String value) onChange,
    bool? isObscure = false,
  }) {
    return TextField(
      controller: controller,
      autocorrect: true,
      obscureText: isObscure!,
      decoration: InputDecoration(
        labelText: label,
      ),
      onChanged: onChange,
    );
  }

  @override
  void initState() {
    _controller = Controller(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Auto_Run e @Computed'),
      ),
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                _getInput(
                  _emailController,
                  label: 'E-mail',
                  onChange: (value) => _controller.setEmail(value),
                ),
                SizedBox(height: 15),
                _getInput(
                  _senhaController,
                  label: 'Senha',
                  isObscure: true,
                  onChange: (value) => _controller.setSenha(value),
                ),
              ],
            ),
            SizedBox(height: 30),
            Observer(
              builder: (_) => ElevatedButton.icon(
                onPressed: _controller.formularioValido ? () {} : null,
                icon: Icon(Icons.login),
                label: Text('Logar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
