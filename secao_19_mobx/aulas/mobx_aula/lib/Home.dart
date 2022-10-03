import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_aula/controller.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  /* int _valor = 0;

  void _incrementar() {
    setState(() {
      this._valor++;
    });
  } */

  late Controller _controller;

  @override
  void initState() {
    _controller = Controller();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MobX Aula'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              /**
               * Observer é um widget que é responsável por reagir as alterações dos observaveis
               */
              child: Observer(builder: (_) {
                return Text(
                  _controller.contador.toString(),
                  style: TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Incrementar',
        child: Icon(Icons.add),
        onPressed: _controller.incrementar,
      ),
    );
  }
}
