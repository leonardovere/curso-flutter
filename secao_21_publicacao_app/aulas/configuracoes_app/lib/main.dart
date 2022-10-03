import 'package:configuracoes_app/Home.dart';
import 'package:flutter/material.dart';

void main() {
  /**
   * Anotações em :
   * AndroidManifest.xml -> Android
   * info.plist -> Apple
   */
  runApp(
    MaterialApp(
      title: 'Alcool ou Gasolina',
      debugShowCheckedModeBanner: false,
      home: Home(),
    ),
  );
}
