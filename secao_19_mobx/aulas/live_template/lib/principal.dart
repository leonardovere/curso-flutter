import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_aula/controller.dart';
import 'package:mobx_aula/item_controller.dart';
import 'package:mobx_aula/principal_controller.dart';
import 'package:provider/provider.dart';

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  PrincipalController _principalController = PrincipalController();

  void _dialog() {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text("Adicionar item"),
            content: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Digite uma descrição..."),
              onChanged: _principalController.setNome,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Cancelar",
                  style: TextStyle(color: Colors.red),
                ),
              ),
              TextButton(
                onPressed: () {
                  _principalController.adicionarItem();
                  Navigator.pop(context);
                },
                child: Text("Salvar"),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<Controller>(context);

    return Observer(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Olá, ${controller.email} !',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
        body: Observer(builder: (_) {
          return ListView.builder(
            itemCount: _principalController.itens.length,
            itemBuilder: (_, indice) {
              ItemController item = _principalController.itens[indice];

              return Observer(builder: (_) {
                return CheckboxListTile(
                  value: item.marcado,
                  title: Text(
                    item.titulo,
                    style: TextStyle(
                      decoration:
                          item.marcado ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  onChanged: item.alterar,
                );
              });
            },
          );
        }),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _dialog,
        ),
      );
    });
  }
}
