import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: Text(
          "Título do App",
        ), // Title define o título que será exibído na appBar
        backgroundColor: Colors.blue, // Define a cor do appBar
      ), // Cria a uma barra superior do aplicativo
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Text("Conteúdo principal"),
      ), // Cria o corpo do aplicativo, onde irá conter o conteúdo
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Conteúdo 01"),
              Text("Conteúdo 02")
            ],
          ),
        ),
      ), // Cria uma barra de navegação inferior do app
    ), // Define a estrutura base do app
  ));
}
