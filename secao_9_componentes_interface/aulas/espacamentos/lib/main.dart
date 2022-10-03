import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false, // Remove a marca d'àgua de debug
    title: "Frases do dia",
    home: Container(
      padding: EdgeInsets.fromLTRB(
        0, // Padding left
        0, // Padding top
        0, // Padding right
        0, // padding bottom
      ), // Configura o espaçamento interno
      margin: EdgeInsets.all(20),
      // margin: EdgeInsets.only(top: 50), // Somente nos campos selecionados
      decoration: BoxDecoration(
          border: Border.all(
              width: 3, color: Colors.blue) // define uma borda nas 4 direções
          ), // Define o estilo do box
      child: Column(
        children: [
          Text("t1"),
          Padding(
            padding: EdgeInsets.all(30),
            child: Text("t2"),
          ), // Widget padding como atributo
          Text("t3")
          /* Text(
            "Lorem ipsum dolor sit amet, consectetur Pellentesque nec risus a justo tincidunt varius.",
            textAlign: TextAlign.justify, // Configura o alinhamento do texto
          ), */
        ],
      ),
    ),
  ));
}
