import 'package:flutter/material.dart';

class ResponsividadeWrap extends StatefulWidget {
  const ResponsividadeWrap({Key? key}) : super(key: key);

  @override
  _ResponsividadeWrapState createState() => _ResponsividadeWrapState();
}

class _ResponsividadeWrapState extends State<ResponsividadeWrap> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    double altura = 100;
    double largura = 100;

    return Scaffold(
      appBar: AppBar(
        title: Text('Responsividade Wrap'),
      ),
      body: Container(
        color: Colors.black,
        width: mediaQuery.size.width,
        /**
         * Widget wrap é usado para quebrar o componente para as linhas inferiores
         * quando o mesmo não puder ser exibido na linha superior.
         */
        child: Wrap(
          // Define o alinhamento dos componentes
          alignment: WrapAlignment.center,
          runSpacing: 10,
          // Define o espaço entre um item e outro
          spacing: 10,
          children: [
            Container(
              height: altura,
              width: largura,
              color: Colors.blue[800],
            ),
            Container(
              height: altura,
              width: largura,
              color: Colors.blue[600],
            ),
            Container(
              height: altura,
              width: largura,
              color: Colors.blue[300],
            ),
            Container(
              height: altura,
              width: largura,
              color: Colors.blue[800],
            ),
            Container(
              height: altura,
              width: largura,
              color: Colors.blue[600],
            ),
          ],
        ),
      ),
    );
  }
}
