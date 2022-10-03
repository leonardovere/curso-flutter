import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:olx/models/Anuncio.dart';
import 'package:olx/widgets/ItemAnuncio.dart';

class MeusAnuncios extends StatefulWidget {
  @override
  _MeusAnunciosState createState() => _MeusAnunciosState();
}

class _MeusAnunciosState extends State<MeusAnuncios> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseStorage _storage = FirebaseStorage.instance;

  final StreamController<QuerySnapshot> _streamController =
      StreamController<QuerySnapshot>.broadcast();

  Stream<QuerySnapshot> _adicionarListenerAnuncios() {
    Stream<QuerySnapshot> stream = _firestore
        .collection("meus_anuncios")
        .doc(_auth.currentUser.uid)
        .collection("anuncios")
        .snapshots();

    stream.listen((QuerySnapshot snapshot) {
      _streamController.add(snapshot);
    });
  }

  Future<void> _removerAnuncio(Anuncio anuncio) async {
    bool remover = await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => AlertDialog(
        title: Text('Remover anúncio'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Text('Tem certeza que deseja remover ${anuncio.titulo} ?'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(
              'Cancelar',
              style: TextStyle(color: Colors.red),
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.purple),
            ),
            child: Text('Confirmar'),
          ),
        ],
      ),
    );

    if (remover) {
      _firestore
          .collection("meus_anuncios")
          .doc(_auth.currentUser.uid)
          .collection("anuncios")
          .doc(anuncio.id)
          .delete()
          .then((_) async {
        for (String urlImagem in anuncio.fotos) {
          Reference ref = _storage.refFromURL(urlImagem);
          await ref.delete();
        }

        _firestore.collection("anuncios").doc(anuncio.id).delete();
      });
    }
  }

  @override
  void initState() {
    _adicionarListenerAnuncios();
    super.initState();
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus anúncios'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushNamed(context, "/cadastro_anuncio"),
        icon: Icon(Icons.add),
        label: Text('Adicionar'),
      ),
      body: StreamBuilder(
        stream: _streamController.stream,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.active:
            case ConnectionState.none:
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Center(
                  child: ListTile(
                    leading: Icon(Icons.error_outline_rounded),
                    title: Text('Erro ao carregar meus anúncios'),
                  ),
                );
              } else if (!snapshot.hasData || snapshot.data.docs.isEmpty) {
                return Center(
                  child: ListTile(
                    leading: Icon(Icons.info_outline_rounded),
                    title: Text('Nenhum anúncio cadastrado'),
                  ),
                );
              } else {
                List<Anuncio> anuncios = snapshot.data.docs
                    .map((e) => Anuncio.fromJson(e.data()))
                    .toList();

                return ListView.builder(
                  itemCount: anuncios.length,
                  itemBuilder: (_, index) {
                    Anuncio anuncio = anuncios[index];

                    return ItemAnuncio(
                      onPressed: () {},
                      onRemove: () => _removerAnuncio(anuncio),
                      anuncio: anuncio,
                    );
                  },
                );
              }
              break;
            default:
              return Center(
                child: ListTile(
                  leading: Icon(Icons.error_outline_rounded),
                  title: Text('Erro ao carregar meus anúncios'),
                ),
              );
          }
        },
      ),
    );
  }
}
