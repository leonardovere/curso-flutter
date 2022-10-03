import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputCustomizado extends StatelessWidget {
  InputCustomizado({
    @required this.controller,
    @required this.hint,
    this.maxLines = 1,
    this.type = TextInputType.text,
    this.obscure = false,
    this.autoFocus = false,
    this.inputFormatters,
    this.validator,
    this.onSaved,
  });

  final TextEditingController controller;
  final String hint;
  final int maxLines;
  final bool obscure;
  final bool autoFocus;
  final TextInputType type;
  final List<TextInputFormatter> inputFormatters;
  final String Function(String value) validator;
  final void Function(String value) onSaved;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: this.controller,
        autofocus: this.autoFocus,
        obscureText: this.obscure,
        keyboardType: this.type,
        inputFormatters: this.inputFormatters,
        style: TextStyle(fontSize: 20),
        maxLines: this.maxLines,
        validator: this.validator,
        onSaved: this.onSaved,
        decoration: InputDecoration(
          hintText: this.hint,
          contentPadding: EdgeInsets.all(16),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
