import 'package:flutter/material.dart';

class ResponsividadeRowCol extends StatefulWidget {
  const ResponsividadeRowCol({Key? key}) : super(key: key);

  @override
  _ResponsividadeRowColState createState() => _ResponsividadeRowColState();
}

class _ResponsividadeRowColState extends State<ResponsividadeRowCol> {
  @override
  Widget build(BuildContext context) {
    double altura = MediaQuery.of(context).size.height;
    double largura = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('Responsividade'),
      ),
      body: Column(
        children: [
          Expanded(flex: 2, child: Container(color: Colors.purple[900])),
          Expanded(
            flex: 6,
            child: Row(
              children: [
                Expanded(child: Container(color: Colors.purple[200])),
                Expanded(child: Container(color: Colors.purple[400])),
                Expanded(child: Container(color: Colors.purple[600])),
              ],
            ),
          ),
          Expanded(flex: 1, child: Container(color: Colors.purple[300])),
        ],
      ),
    );
  }
}
