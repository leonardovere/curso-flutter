import 'package:flutter/material.dart';

class RegrasLayout extends StatefulWidget {
  const RegrasLayout({Key? key}) : super(key: key);

  @override
  _RegrasLayoutState createState() => _RegrasLayoutState();
}

class _RegrasLayoutState extends State<RegrasLayout> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Layout Builder'),
      ),
      body: Container(
        width: mediaQuery.size.width,
        color: Colors.blue[800],
        height: mediaQuery.size.height,
        /**
         * o parametro contraints recupera informações do seu elemento pai
         * neste caso, do objeto Container();
         */
        child: LayoutBuilder(
          builder: (context, constraints) {
            /**
             * Paremetro maxWidth retorna o tamanho máximo do widget pai
             * logo com ele é possível criar pontos de parada de acordo com a 
             * largura do dispositivo, modificando a exibição
             */
            double largura = constraints.maxWidth;

            if (largura < 600) {
              // Celulares
              return Text('Celulares');
            } else if (largura < 960) {
              //Celulares maiores e Tablets
              return Text('Celulares e Tablets');
            } else {
              // Navegadores Web e Dispositivos maiores
              return Text('Web e demais dispositivos');
            }
          },
        ),
      ),
    );
  }
}
