import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imageApp =
      AssetImage("images/padrao.png"); // Seleciona uma imagem pelo seu caminho
  var _feedbackJogador = "Escolha uma opção abaixo";
  var _pontuacao = 0;

  void _opcaoSelecionada(int escolhaUsuario) {
    List<String> opcoes = ["Pedra", "Papel", "Tesoura"];

    var opcaoUsuario = opcoes[escolhaUsuario];
    var opcaoApp = opcoes[Random().nextInt(opcoes.length)];

    setState(() {
      // Exibição da imagem escolhida pelo App
      switch (opcaoApp) {
        case "Pedra":
          _imageApp = AssetImage("images/pedra.png");
          break;
        case "Papel":
          _imageApp = AssetImage("images/papel.png");
          break;
        case "Tesoura":
          _imageApp = AssetImage("images/tesoura.png");
          break;
        default:
          _imageApp = AssetImage("images/padrao.png");
          break;
      }
    });

    print("Escolha usuário: $opcaoUsuario X Escolha app: $opcaoApp");

    if (opcaoUsuario == opcaoApp) {
      setState(() {
        _feedbackJogador = "Deu Empate !!";
      });
    } else {
      if (opcaoUsuario == opcoes[0]) {
        if (opcaoApp == opcoes[1]) {
          setState(() {
            _feedbackJogador = "O App venceu =(";
            _pontuacao -= 5;
          });
        } else if (opcaoApp == opcoes[2]) {
          setState(() {
            _feedbackJogador = "Você venceu =)";
            _pontuacao += 25;
          });
        }
      } else if (opcaoUsuario == opcoes[1]) {
        if (opcaoApp == opcoes[0]) {
          setState(() {
            _feedbackJogador = "Você venceu =)";
            _pontuacao += 25;
          });
        } else if (opcaoApp == opcoes[2]) {
          setState(() {
            _feedbackJogador = "O App venceu =(";
            _pontuacao -= 5;
          });
        }
      } else if (opcaoUsuario == opcoes[2]) {
        if (opcaoApp == opcoes[0]) {
          setState(() {
            _feedbackJogador = "O App venceu =(";
            _pontuacao -= 5;
          });
        } else if (opcaoApp == opcoes[1]) {
          setState(() {
            _feedbackJogador = "Você venceu =)";
            _pontuacao += 25;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App:",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          /* GestureDetector(
            onDoubleTap: () => print("Dois cliques na imagem!"), // Quando tiver um duplo clique encima
            onTap: () => print("Um clique na imagem!"), // Quando tiver apenas um clique
            onLongPress: () => print("Clique longo na imagem!"), // Quando mantem pressioando o clique
            child: Image.asset("images/padrao.png"),
          ), // Observa os eventos de clique encima de um determinado item ou componente */
          Image(image: this._imageApp),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._feedbackJogador,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              /* Image.asset("images/pedra.png", height: 100),
              Image.asset("images/papel.png", height: 100),
              Image.asset("images/tesoura.png", height: 100), */
              GestureDetector(
                child: Image.asset("images/pedra.png", height: 100),
                onTap: () => _opcaoSelecionada(0),
              ),
              GestureDetector(
                child: Image.asset("images/papel.png", height: 100),
                onTap: () => _opcaoSelecionada(1),
              ),
              GestureDetector(
                child: Image.asset("images/tesoura.png", height: 100),
                onTap: () => _opcaoSelecionada(2),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text(
              "Pontuação: $_pontuacao",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
