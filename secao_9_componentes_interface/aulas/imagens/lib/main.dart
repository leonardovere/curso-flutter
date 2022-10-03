import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Frases do dia",
    home: Container(
      margin: EdgeInsets.only(top: 40),
      decoration:
          BoxDecoration(border: Border.all(width: 3, color: Colors.black)),
      child: Image.asset(
        "images/mesa.jpg", // caminho relativo a imagem salva no diretório images

        /**
         * Define como a imagem será exibida
         * 
         * contain -> padrão, a imagem copa seu tamanho original, independente da orientação da tela.
         * 
         * cover -> ocupa todo o espaçamento disponível distribuindo a imagem
         * 
         * fill -> ocupa todo o espaçamento e distribuindo de maneira que distorce a imagem
         * 
         * fitHeight -> distribui a imagem para que ela ocupe a altura máxima
         * 
         * fitWidth -> distribui a imagem para que ela ocupe a largura máxima
         * 
         * none -> a imagem ocupa sua dimenssão original
         * 
         * scaleDown -> a imagem é renderizada sem que seja distorcida
         */
        fit: BoxFit.scaleDown,
      ),
    ),
  ));
}
