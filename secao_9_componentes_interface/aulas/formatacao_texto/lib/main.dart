import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Frases do dia",

    /**
     * Por padrão o conteiner define a área total
     * da tela, ou seja, ocupa todo o campo visível
     * podendo quebrar o texto para mais linhas.
     */
    home: Container(
      color: Colors.white,

      /**
       * O filho do container, o que será depente das
       * configurações do seu pai, no caso o container
       */
      child: Column(

        /**
         * Uma lista de filhos que o widget irá ter
         */
        children: [
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            style: TextStyle(
              fontSize: 50,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              letterSpacing: 0, // Espaçamento entre letras
              wordSpacing: 10, // Espaçamento entre palavras
              decoration: TextDecoration.lineThrough, // define o estilo do texto
              decorationColor: Colors.blue,
              decorationStyle: TextDecorationStyle.solid,
              color: Colors.black
            ), // Manipula o estilo do texto
          ), // Insere um texto na tela
        ],
      ),
    ), 
  ));
}
