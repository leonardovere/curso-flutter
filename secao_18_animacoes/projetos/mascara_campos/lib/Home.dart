import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _cpfController = TextEditingController();
  TextEditingController _cnpjController = TextEditingController();
  TextEditingController _cepController = TextEditingController();
  TextEditingController _telefoneController = TextEditingController();
  TextEditingController _dataController = TextEditingController();
  TextEditingController _moedaController = TextEditingController();
  String _valorCampo = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Máscaras e Validações"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // CPF
            TextField(
              controller: _cpfController,
              keyboardType: TextInputType.number,

              // Define formatadores para o campo
              inputFormatters: [
                // Aceita somente números
                FilteringTextInputFormatter.digitsOnly,
                CpfInputFormatter(),
              ],
              decoration: InputDecoration(
                hintText: 'Digite CPF',
                border: OutlineInputBorder(),
              ),
            ),

            // CNPJ
            TextField(
              controller: _cnpjController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CnpjInputFormatter(),
              ],
              decoration: InputDecoration(
                hintText: 'Digite CNPJ',
                border: OutlineInputBorder(),
              ),
            ),

            // CEP
            TextField(
              controller: _cepController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CepInputFormatter(ponto: false),
              ],
              decoration: InputDecoration(
                hintText: 'Digite CEP',
                border: OutlineInputBorder(),
              ),
            ),

            // Telefone
            TextField(
              controller: _telefoneController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                TelefoneInputFormatter(),
              ],
              decoration: InputDecoration(
                hintText: 'Digite Telefone',
                border: OutlineInputBorder(),
              ),
            ),

            // Data
            TextField(
              controller: _dataController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                DataInputFormatter(),
              ],
              decoration: InputDecoration(
                hintText: 'Digite a Data',
                border: OutlineInputBorder(),
              ),
            ),

            // Moeda
            TextField(
              controller: _moedaController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                RealInputFormatter(centavos: true, moeda: true),
              ],
              decoration: InputDecoration(
                hintText: 'Digite Valor',
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  // Converte o valor da moeda em double
                  /* _valorCampo = UtilBrasilFields.converterMoedaParaDouble(
                    _moedaController.text,
                  ).toString(); */

                  double valorConvertido =
                      UtilBrasilFields.converterMoedaParaDouble(
                    _moedaController.text,
                  );

                  NumberFormat numberFormat = NumberFormat.currency(
                    locale: 'pt_BR',
                    symbol: "R\$",
                    decimalDigits: 2,
                  );

                  String resultado = numberFormat.format(valorConvertido);
                  _valorCampo = resultado;

                  // Classe oferece padrões de estados, semanas, messes
                  for (var item in Estados.listaEstados) {
                    print(item);
                  }
                });
              },
              child: Text('Recuperar Valor'),
            ),
            Text(
              'Valor: $_valorCampo',
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
