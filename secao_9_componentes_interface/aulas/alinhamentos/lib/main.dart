import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Frases do dia",
    home: Container(
      margin: EdgeInsets.only(top: 40),
      decoration: BoxDecoration(
        border: Border.all(width: 3, color: Colors.black)
      ),
      child: Column(
        /**
         * start -> ao início da principal (padrão)
         * center -> centraliza na principal
         * end -> ao final da principal
         * spaceEvenly -> alinhamento de maneira uniforme
         * spaceAround -> seta um valor para para fora, e redistribui entre os itens
         * spaceBetween -> os últimos itens ficam colados nos cantos e mantendo a mesma distância dos itens ao centro
         */
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Define o alinhamento principal do widget

        /**
         * 
         */
        crossAxisAlignment: CrossAxisAlignment.end,// Define o alinhamento do eixo que cruza o eixo principal
        children: <Widget>[
          Text("T1"),
          Text("T2"),
          Text("T3")
        ],
      ),
    ), 
  ));
}
