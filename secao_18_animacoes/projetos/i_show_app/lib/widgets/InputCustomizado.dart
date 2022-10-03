import 'package:flutter/material.dart';

class InputCustomizado extends StatelessWidget {
  final bool isSenha;
  final Widget icone;
  final String label;

  const InputCustomizado({
    Key? key,
    required this.icone,
    required this.label,
    this.isSenha = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        obscureText: isSenha,
        decoration: InputDecoration(
          icon: icone,
          labelText: label,
          border: InputBorder.none,
          hintStyle: TextStyle(
            color: Colors.grey[600],
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
