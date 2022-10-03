import 'package:brasil_fields/brasil_fields.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:validadores/Validador.dart';

class Formulario extends StatefulWidget {
  const Formulario({Key key}) : super(key: key);

  @override
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final _formKey = GlobalKey<FormState>();
  String _mensagem = "";

  TextEditingController _nomeController = TextEditingController(
    text: 'Leonardo Roberto Candido',
  );
  TextEditingController _idadeController = TextEditingController(
    text: '22',
  );
  TextEditingController _cpfController = TextEditingController(
    text: '097.791.049-09',
  );

  Map<String, dynamic> _pessoa = Map<String, dynamic>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                onSaved: (value) {
                  _pessoa['nome'] = value;
                },
                controller: _nomeController,
                decoration: InputDecoration(
                  hintText: 'Digite seu nome',
                ),
                validator: (value) => Validador()
                    .add(Validar.OBRIGATORIO, msg: "Campo obrigatório")
                    .minLength(5, msg: "Mínimo de 5 caracteres")
                    .maxLength(100, msg: "Máximo de 100 caracteres")
                    .valido(value),
              ),
              TextFormField(
                onSaved: (value) {
                  _pessoa['idade'] = value;
                },
                controller: _idadeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Digite sua idade',
                ),
                validator: (value) => Validador()
                    .add(Validar.OBRIGATORIO, msg: "Campo obirgatório")
                    .valido(value),
              ),
              TextFormField(
                onSaved: (value) {
                  _pessoa['cpf'] = value;
                },
                controller: _cpfController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Digite seu CPF',
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CpfInputFormatter()
                ],
                validator: (value) => value.isEmpty
                    ? 'Campo obrigatório'
                    : (CPFValidator.isValid(value) ? null : 'CPF inválido'),

                /* Validador()
                    .add(Validar.OBRIGATORIO, msg: "Campo obirgatório")
                    .add(Validar.CPF, msg: "Não é um CPF válido")
                    .valido(value); */
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    /**
                     * Salva os dados dos campos
                     * hablitando o método onSaved de cada formField
                     */
                    _formKey.currentState.save();
                    /* _pessoa['nome'] = _nomeController.text;
                    _pessoa['idade'] = _idadeController.text;
                    _pessoa['cpf'] = _cpfController.text; */

                    print(_pessoa);

                    setState(() {
                      _mensagem = _pessoa.toString();
                    });
                  } else {
                    setState(() {
                      _mensagem = "";
                    });
                  }
                },
                child: Text('Salvar'),
              ),
              Text(
                _mensagem,
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
