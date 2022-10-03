import 'package:flutter/material.dart';
import 'package:olx/models/Anuncio.dart';
import 'package:olx/views/Anuncios.dart';
import 'package:olx/views/CadastroAnuncio.dart';
import 'package:olx/views/DetalhesAnuncio.dart';
import 'package:olx/views/Login.dart';
import 'package:olx/views/MeusAnuncios.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    final caminho = settings.name;

    final Map<String, MaterialPageRoute> rotas = {
      "/": MaterialPageRoute(builder: (_) => Anuncios()),
      '/login': MaterialPageRoute(builder: (_) => Login()),
      '/meus_anuncios': MaterialPageRoute(builder: (_) => MeusAnuncios()),
      '/cadastro_anuncio': MaterialPageRoute(builder: (_) => CadastroAnuncio()),
      '/detalhe_anuncio': MaterialPageRoute(
        builder: (_) => DetalhesAnuncio(anuncio: args as Anuncio),
      ),
    };

    return rotas[caminho] ?? _erroRota();
  }

  static Route<dynamic> _erroRota() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('Erro ao navegar'),
        ),
        body: Center(
          child: Text('Página não encontrada !!'),
        ),
      ),
    );
  }
}
