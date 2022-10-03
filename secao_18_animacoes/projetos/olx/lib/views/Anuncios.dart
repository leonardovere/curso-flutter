import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:olx/models/Anuncio.dart';
import 'package:olx/utils/Configuracoes.dart';
import 'package:olx/widgets/ItemAnuncio.dart';

class Anuncios extends StatefulWidget {
  const Anuncios({Key key}) : super(key: key);

  @override
  _AnunciosState createState() => _AnunciosState();
}

class _AnunciosState extends State<Anuncios> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<String> _itensMenu = [];

  List<DropdownMenuItem<String>> _listaCategorias;
  List<DropdownMenuItem<String>> _listaEstados;

  String _estadoSelecionado = 'regiao';
  String _categoriaSelecionada = 'categoria';

  StreamController _controller = StreamController<QuerySnapshot>.broadcast();

  void _selecionar(String opcao) {
    switch (opcao) {
      case 'Meus Anúncios':
        Navigator.pushNamed(context, "/meus_anuncios");
        break;
      case 'Logar':
        Navigator.pushReplacementNamed(context, "/login");
        break;
      case 'Deslogar':
        _deslogar();
        break;
    }
  }

  void _deslogar() {
    _auth.signOut().then((_) {
      Navigator.pushReplacementNamed(context, "/login");
    });
  }

  void _verificarUsuarioLogado() {
    if (_auth.currentUser == null) {
      _itensMenu = ["Logar"];
    } else {
      _itensMenu = ["Meus Anúncios", "Deslogar"];
    }
  }

  Future<void> _filtrarAnuncios() async {
    Query query = _firestore.collection("anuncios");

    if (_estadoSelecionado != "regiao") {
      query = query.where("estado", isEqualTo: _estadoSelecionado);
    }

    if (_categoriaSelecionada != "categoria") {
      query = query.where("categoria", isEqualTo: _categoriaSelecionada);
    }

    Stream<QuerySnapshot> stream = query.snapshots();
    stream.listen((snapshot) {
      _controller.add(snapshot);
    });
  }

  Future<void> _adicionarListener() async {
    Stream<QuerySnapshot> stream =
        _firestore.collection("anuncios").snapshots();
    stream.listen((snapshot) {
      _controller.add(snapshot);
    });
  }

  @override
  void initState() {
    _verificarUsuarioLogado();
    _adicionarListener();

    _listaCategorias = Configuracoes.getCategorias();
    _listaEstados = Configuracoes.getEstados();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OLX'),
        actions: [
          PopupMenuButton(
            onSelected: _selecionar,
            itemBuilder: (_) => _itensMenu
                .map(
                  (e) => PopupMenuItem(
                    value: e,
                    child: Text(e),
                  ),
                )
                .toList(),
          )
        ],
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            child: Row(
              children: [
                Expanded(
                  // Remove a linha inferior do dropdownbutton
                  child: DropdownButtonHideUnderline(
                    child: Center(
                      child: DropdownButton(
                        value: _estadoSelecionado,
                        items: _listaEstados,
                        iconEnabledColor: Colors.purple,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        onChanged: (estado) {
                          setState(() {
                            _estadoSelecionado = estado;
                            _filtrarAnuncios();
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  width: 2,
                  color: Colors.grey[200],
                ),
                Expanded(
                  // Remove a linha inferior do dropdownbutton
                  child: DropdownButtonHideUnderline(
                    child: Center(
                      child: DropdownButton(
                        value: _categoriaSelecionada,
                        items: _listaCategorias,
                        iconEnabledColor: Colors.purple,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        onChanged: (categoria) {
                          setState(() {
                            _categoriaSelecionada = categoria;
                            _filtrarAnuncios();
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder(
              stream: _controller.stream,
              // ignore: missing_return
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                    break;
                  case ConnectionState.active:
                  case ConnectionState.none:
                  case ConnectionState.done:
                    if (snapshot.hasData && snapshot.data.docs.length > 0) {
                      QuerySnapshot querySnapshot =
                          snapshot.data as QuerySnapshot;
                      List<Anuncio> anuncios = querySnapshot.docs
                          .map((e) => Anuncio.fromJson(e.data()))
                          .toList();

                      return ListView.builder(
                        itemCount: anuncios.length,
                        itemBuilder: (_, index) {
                          Anuncio anuncio = anuncios[index];

                          return ItemAnuncio(
                            onPressed: () => Navigator.pushNamed(
                              context,
                              "/detalhe_anuncio",
                              arguments: anuncio,
                            ),
                            anuncio: anuncio,
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: ListTile(
                          leading: Icon(Icons.info_outline_rounded),
                          title: Text('Não foi possível recuperar os anúncios'),
                        ),
                      );
                    }
                    break;
                  default:
                    return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
