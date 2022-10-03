// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:observable_list/item-controller.dart';
import 'package:observable_list/principal_controller.dart';

// ignore: use_key_in_widget_constructors
class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  late PrincipalController _controller;

  void _abrirDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: const Text('Adicionar item'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            TextField(
              controller: _controller.descricaoController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Digite algo ...',
              ),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(primary: Colors.red),
            child: Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: _controller.adicionarTarefa,
            style: ElevatedButton.styleFrom(primary: Colors.green),
            child: Text('Salvar'),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    _controller = PrincipalController(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Observable List'),
      ),
      body: Observer(
        builder: (_) => ListView.builder(
          itemCount: _controller.tarefas.length,
          itemBuilder: (_, index) {
            ItemController item = _controller.tarefas[index];

            return Observer(
              builder: (_) => ListTile(
                onTap: () => item.alterarStatus(!item.marcado) ,
                leading: Checkbox(
                  value: item.marcado,
                  onChanged: item.alterarStatus,
                ),
                title: Text(
                  item.nome,
                  style: TextStyle(
                    decoration: item.marcado
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _abrirDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
