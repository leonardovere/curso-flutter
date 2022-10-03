import 'package:flutter/material.dart';

class Orientacao extends StatefulWidget {
  const Orientacao({Key? key}) : super(key: key);

  @override
  _OrientacaoState createState() => _OrientacaoState();
}

class _OrientacaoState extends State<Orientacao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orientação'),
      ),
      body: OrientationBuilder(
        builder: (_, orientation) =>
            /* Container(
          child: Text(
            orientation == Orientation.portrait ? 'Portraint' : 'Landscape',
          ),
        ), */
            GridView.count(
          crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
          children: [
            Container(color: Colors.red),
            Container(color: Colors.yellow),
            Container(color: Colors.orange),
            Container(color: Colors.purple),
            Container(color: Colors.green),
            Container(color: Colors.brown),
          ],
        ),
      ),
    );
  }
}
