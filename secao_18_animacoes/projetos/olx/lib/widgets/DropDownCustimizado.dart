import 'package:flutter/material.dart';

class DropDownCustimizado extends StatelessWidget {
  final String valorInicial;
  final String hint;
  final List<DropdownMenuItem<String>> items;
  final String Function(String) validator;
  final void Function(String value) onChanged;
  final void Function(String value) onSaved;

  DropDownCustimizado({
    @required this.valorInicial,
    @required this.hint,
    @required this.items,
    @required this.onChanged,
    this.onSaved,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: valorInicial,
      hint: Text(hint),
      items: items,
      validator: validator,
      onChanged: onChanged,
      onSaved: onSaved,
    );
  }
}
