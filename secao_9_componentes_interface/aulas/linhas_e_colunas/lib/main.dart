import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Frases do dia",

    // Column - Cria uma coluna
    // Row - Cria uma linha
    home: Row(

      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(' T1 '),
        Text(' T2 '),
        Text(' T3 '),
      ], // Recebe uma lista de widgets
    ), 
  ));
}
