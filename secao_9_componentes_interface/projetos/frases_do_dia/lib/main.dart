import 'dart:math';
import 'package:flutter/material.dart';

// Todo código dart é executado dentro da função main
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Frases do dia",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static List<String> _frases = [
    "Bom dia! Hoje respire alegria, esperança e otimismo. Ignore os sentimentos menos bons que possam surgir e lute com garra para ultrapassar todos os desafios.",
    "Tudo que conseguimos alcançar através do nosso esforço tem sabor de vitória merecida. E no final a recompensa sempre prevalece sobre o caminho de dificuldades que passamos.",
    "Então jamais se diminua perante a vida e suas complicações, e tenha um dia muito especial, não só hoje, mas sempre!",
    "O maior bem que temos na vida é o tempo. O tempo é o tecido que urde a vida, aproveite o seu tempo ao máximo, aproveite cada dia como se fosse o único, aproveite a vida.",
    "O que não deu certo hoje, pode dar amanhã. Para que um novo dia aconteça em sua vida, a terra toda se mobiliza, tudo no mundo muda. A cada amanhecer, o mundo está diferente, se você acha que todos os dias são iguais, você está muito enganado.",
    "Cada dia que nasce é uma nova chance de corrigir os erros de ontem, de mudar o que não funcionou, de continuar o que não terminou, mas sabendo que você está diferente, e que tudo, por mais que pareça igual, também mudou."
  ];

  String _frase = "Clique no botão para gerar uma frase";

  void _gerarFrase() {
    var index = Random().nextInt(_frases.length);
    _frase = _frases[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frases do Dia"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          // width: double.infinity, -> Define que o width ocupe 100% do espaço disponível
          // Para centralizar também pode ser usado o widget Center
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "images/logo.png",
                fit: BoxFit.scaleDown,
              ),
              Text(
                _frase,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 25,
                  fontStyle: FontStyle.italic,
                ),
              ),
              RaisedButton(
                onPressed: () => setState(() {_gerarFrase();}),
                color: Colors.green,
                child: Text(
                  "Nova Frase",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
