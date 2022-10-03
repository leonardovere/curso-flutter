import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Variável não pode ser nula
  String _nome = "Leonardo";
  int _idade = 22;
  double _altura = 1.75; 

  // Precisa explicitar que a variável pode ser nula
  String? _complemento;
  int? _numero;
  double? _preco;

  // Inicialização tardia, define que a variável iniciará
  // sem valor mas que será iniciada no futuro
  late double _salario;

  @override
  void initState() {
    super.initState();

    _salario = 1000;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}