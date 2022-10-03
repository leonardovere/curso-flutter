import 'package:flutter/material.dart';

class ItemProduto extends StatelessWidget {
  final String imagem;
  final String preco;
  final String descricao;

  ItemProduto({
    required this.imagem,
    required this.descricao,
    required this.preco,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 2, color: Colors.grey),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 8,
            child: Image.asset(
              'assets/images/${this.imagem}',
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(this.descricao),
          ),
          Expanded(
            flex: 1,
            child: Text('R\$ ${this.preco}'),
          ),
        ],
      ),
    );
  }
}
