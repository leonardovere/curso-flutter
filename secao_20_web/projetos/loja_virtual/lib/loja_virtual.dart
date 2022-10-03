import 'package:flutter/material.dart';
import 'package:loja_virtual/widgets/item_produto.dart';
import 'package:loja_virtual/widgets/mobile_app_bar.dart';
import 'package:loja_virtual/widgets/web_app_bar.dart';

class LojaVirtual extends StatefulWidget {
  const LojaVirtual({Key? key}) : super(key: key);

  @override
  _LojaVirtualState createState() => _LojaVirtualState();
}

class _LojaVirtualState extends State<LojaVirtual> {
  int _alterarVisualizacao(double largura) {
    int colunas = 2;

    if (largura <= 600) {
      colunas = 2;
    } else if (largura <= 960) {
      colunas = 4;
    } else {
      colunas = 6;
    }

    return colunas;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double largura = constraints.maxWidth;

        return Scaffold(
          appBar: largura < 600
              /**
               * É usado para envelopar uma appbar customizada
               */
              ? PreferredSize(
                  child: MobileAppBar(),
                  preferredSize: AppBar().preferredSize,
                )
              : PreferredSize(
                  child: WebAppBar(),
                  preferredSize: AppBar().preferredSize,
                ),
          body: Padding(
            padding: EdgeInsets.all(16),
            child: Container(
              child: GridView.count(
                crossAxisCount: _alterarVisualizacao(largura),
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: [
                  ItemProduto(
                    imagem: 'p1.jpg',
                    descricao: 'Kit Multimídia',
                    preco: "2.200,00",
                  ),
                  ItemProduto(
                    imagem: 'p2.jpg',
                    descricao: 'Pneu Goodyear Aro 16',
                    preco: "800,00",
                  ),
                  ItemProduto(
                    imagem: 'p3.jpg',
                    descricao: "Samsung 9",
                    preco: "4.100,00",
                  ),
                  ItemProduto(
                    imagem: 'p4.jpg',
                    descricao: "Samsung Edge",
                    preco: "2.150,00",
                  ),
                  ItemProduto(
                    imagem: 'p5.jpg',
                    descricao: "Galaxy 10",
                    preco: "6.200,00",
                  ),
                  ItemProduto(
                    imagem: 'p6.jpg',
                    descricao: "iPhone 10",
                    preco: "3.350,00",
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
