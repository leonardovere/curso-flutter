import 'package:flutter/material.dart';

class BotaoCustomizado extends StatelessWidget {
  final String texto;
  final Color corTexto;
  final VoidCallback onPressed;
  final double radius;

  BotaoCustomizado({
    @required this.texto,
    @required this.onPressed,
    this.corTexto = Colors.white,
    this.radius = 10,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: this.onPressed,
      child: Text(
        this.texto,
        style: TextStyle(
          fontSize: 20,
          color: this.corTexto,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.purple),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(vertical: 16, horizontal: 60),
        ),
      ),
    );
  }
}
