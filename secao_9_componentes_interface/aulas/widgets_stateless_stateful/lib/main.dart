import 'package:flutter/material.dart';

/**
 * Stateless -> Widgets que não podem ser alterados (constantes)
 * Stateful -> Widgets que podem ser alterados (variáveis)
 */
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeStateful(),
  ));
}

class HomeStateful extends StatefulWidget {
  // createState -> cria um estado inicial
  @override
  _HomeStatefulState createState() => _HomeStatefulState();
}

class _HomeStatefulState extends State<HomeStateful> {

  /**
   * variáveis que serão dinâmicas no app, devem
   * ficar fora da estrutura do build
   */
  var _nome = "Curso Flutter";

  // Método build é chamado sempre que um estado é alterado
  @override
  Widget build(BuildContext context) {
    var _titulo = "Título do App";

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titulo,
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RaisedButton(
              onPressed: () {
                print("clicado");

                // Método utilizado para alterar o estado do app
                setState(() {
                  _nome = "Leonardo";
                });
              },
              child: Text(
                "Clique Aqui",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
            ), // Similar ao FlatButton, vem com uma cor de fundo também
            Text("Nome: ${_nome ?? 'Sem valor atribuído'}")
          ],
        ),
      ),
    );
  }
}

// Estrutura básica de um stateless
class Home extends StatelessWidget {
  // Método build -> contrói o app, no statelees, ele é
  // executado apenas uma única vez
  @override
  Widget build(BuildContext context) {
    /**
     * Antes de construir o app, podem ser definidos alguns
     * parâmetros como variáveis e métodos.
     */
    var _titulo = "Título do App";

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titulo,
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Text("Conteúdo principal"),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [Text("Conteúdo 01"), Text("Conteúdo 02")],
          ),
        ),
      ),
    );
  }
}
