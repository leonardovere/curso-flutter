import 'dart:ui';

import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:olx/main.dart';
import 'package:olx/models/Anuncio.dart';
import 'package:olx/widgets/BotaoCustomizado.dart';

class DetalhesAnuncio extends StatefulWidget {
  final Anuncio anuncio;

  DetalhesAnuncio({@required this.anuncio});

  @override
  _DetalhesAnuncioState createState() => _DetalhesAnuncioState();
}

class _DetalhesAnuncioState extends State<DetalhesAnuncio> {
  Anuncio _anuncio;

  List<Widget> _getListaImagens() {
    if (_anuncio.fotos.isEmpty) {}

    return _anuncio.fotos.isNotEmpty
        ? _anuncio.fotos
            .map((url) => Image.network(url, fit: BoxFit.fitWidth))
            .toList()
        : [
            Container(
              height: 250,
              color: Colors.grey,
              child: Center(
                child: Icon(
                  Icons.image,
                  size: 100,
                  color: Colors.grey[600],
                ),
              ),
            ),
          ];
  }

  void _ligarTelefone() async {
    String telefone = 'tel:${_anuncio.telefone}';

    if (await canLaunch(telefone)) {
      await launch(telefone);
    } else {
      print('Não pode fazer a ligação');
    }
  }

  @override
  void initState() {
    _anuncio = widget.anuncio;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Anúncio")),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 250,
                      child: Carousel(
                        images: _getListaImagens(),
                        dotSize: 8,
                        dotBgColor: Colors.transparent,
                        dotIncreasedColor: Colors.purple,
                        autoplay: true,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            NumberFormat.currency(
                              symbol: 'R\$',
                              decimalDigits: 2,
                              locale: "pt_BR",
                            ).format(_anuncio.preco),
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: temaPadrao.primaryColor,
                            ),
                          ),
                          Text(
                            '${_anuncio.titulo} (${_anuncio.categoria}) - ${_anuncio.estado}',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Divider(),
                          ),
                          Text(
                            'Descrição',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            _anuncio.descricao,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Divider(),
                          ),
                          Text(
                            'Contato',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            _anuncio.telefone,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: BotaoCustomizado(
              radius: 32,
              texto: 'Ligar',
              onPressed: _ligarTelefone,
            ),
          ),
        ],
      ),
    );
  }
}
