import 'package:flutter/material.dart';

class ResponsividadeMediaQuery extends StatefulWidget {
  const ResponsividadeMediaQuery({Key? key}) : super(key: key);

  @override
  _ResponsividadeMediaQueryState createState() =>
      _ResponsividadeMediaQueryState();
}

class _ResponsividadeMediaQueryState extends State<ResponsividadeMediaQuery> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    double largura = mediaQuery.size.width;
    double altura = mediaQuery.size.height;
    double alturaBarraStatus = mediaQuery.padding.top;
    double alturaAppBar = AppBar().preferredSize.height;
    double larguraItem = largura / 3;

    altura = altura - alturaBarraStatus - alturaAppBar;

    return Scaffold(
      appBar: AppBar(
        title: Text('Responsividade'),
      ),
      body: Row(
        children: [
          Container(
            width: larguraItem,
            height: 200,
            color: Colors.red,
            child: Text('33%'),
          ),
          Container(
            width: larguraItem,
            height: 200,
            color: Colors.green,
            child: Text('33%'),
          ),
          Container(
            width: larguraItem,
            height: 200,
            color: Colors.yellow,
            child: Text('33%'),
          ),
        ],
      ),
    );
  }
}
