import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerAlcool = new TextEditingController();
  TextEditingController _controllerGasolina = new TextEditingController();
  String _resultado = "";

  void _calcular() {
    try {
      double alcool = 0.0;
      double gasolina = 0.0;

      /**
       * double.tryParse() -> valida se o parâmetro pode ser convertido, terona null caso der errada a conversão
       */
      // alcool = double.tryParse(_controllerAlcool.value.text);

      alcool = double.parse(_controllerAlcool.value.text);
      gasolina = double.parse(_controllerGasolina.value.text);
      double resultado = alcool / gasolina;

      if (resultado < 0.7) {
        setState(() {
          _resultado = "Coloque álcool";
        });
      } else {
        setState(() {
          _resultado = "Coloque Gasolina";
        });
      }
    } catch (e) {
      setState(() {
        _resultado = "Não foi possível calcular";
      });
    }

    _limparCampos();
  }

  void _limparCampos() {
    _controllerAlcool.clear();
    _controllerGasolina.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        /**
         * SingleChildScrollView -> Cria um scroll padrão para o app sempre que o conteúdo sobrepor o tamanho vertical da tela do celular
         */
        child: SingleChildScrollView(
          // Utilizando o padding no SingleChildScrollView, sempre que a tela sofrer um scroll, todo o conteúdo irá subir, e não somente o que está dentro do scroll
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset("assets/images/logo.png"),
              Padding(
                padding: EdgeInsets.only(top: 30, bottom: 20),
                child: Text(
                  "Saiba qual a melhor opção para abastecimento do seu carro",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: TextField(
                  controller: _controllerAlcool,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    labelText: "Preço Álcool",
                    hintText: "Ex.: 2.99",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 40),
                child: TextField(
                  controller: _controllerGasolina,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    labelText: "Preço Gasolina",
                    hintText: "Ex.: 3.99",
                  ),
                ),
              ),
              RaisedButton(
                onPressed: _calcular,
                color: Colors.blue,
                padding: EdgeInsets.symmetric(
                  vertical: 16,
                ),
                child: Text(
                  "Calcular",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  _resultado,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
