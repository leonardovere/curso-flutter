import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';

class Configuracoes {
  static List<DropdownMenuItem<String>> getCategorias() {
    List<Map<String, String>> categorias = [
      {"nome": "Categoria", "descricao": 'categoria'},
      {"nome": "Automóvel", "descricao": "auto"},
      {"nome": "Imóvel", "descricao": "imovel"},
      {"nome": "Mobilia", "descricao": "mobile"},
      {"nome": "Eletrônicos", "descricao": "eletro"},
      {"nome": "Moda", "descricao": "moda"},
      {"nome": "Esportes", "descricao": "esporte"}
    ];

    return categorias
        .map(
          (categoria) => DropdownMenuItem(
            child: categoria['nome'] == 'Categoria'
                ? Text(
                    categoria['nome'],
                    style: TextStyle(
                      color: Colors.purple,
                    ),
                  )
                : Text(categoria['nome']),
            value: categoria['descricao'],
          ),
        )
        .toList();
  }

  static List<DropdownMenuItem<String>> getEstados() {
    List<DropdownMenuItem<String>> estados = [
      DropdownMenuItem(
        child: Text(
          'Região',
          style: TextStyle(
            color: Colors.purple,
          ),
        ),
        value: 'regiao',
      )
    ];

    estados.addAll(
      Estados.listaEstados
          .map(
            (estado) => DropdownMenuItem(
              child: Text(estado),
              value: Estados
                  .listaEstadosSigla[Estados.listaEstados.indexOf(estado)],
            ),
          )
          .toList(),
    );

    return estados;
  }
}
