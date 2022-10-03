import 'package:flutter/material.dart';
import 'package:mobx_aula/Home.dart';
import 'package:mobx_aula/controller.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      /**
       * Armazena várias instancias de classes que
       * podem ser recuperadas em outras classes
       */
      providers: [
        Provider<Controller>(create: (_) => Controller()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    ),
  );
}
