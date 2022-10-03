import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Frases do dia",
    home: Container(
      color: Colors.white,
      child: Column(
        children: [
          FlatButton(
            onPressed: (){
              print("O botão foi pressionado");
            }, // A ação que o botão irá executar
            child: Text(
              "Clique aqui",
              style: TextStyle(
                fontSize: 20,
                backgroundColor: Colors.black,
                color: Colors.white,
                decoration: TextDecoration.none
              ),
            ), // o conteúdo filho
          ), // declara um botão
        ],
      ),
    ),
  ));
}
