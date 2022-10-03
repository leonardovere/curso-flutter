import 'package:flutter/material.dart';
import 'package:observable_list/Home.dart';
import 'package:observable_list/controller.dart';
import 'package:provider/provider.dart';

void main() {
  /* runApp(
    MaterialApp(
      title: 'Observable List',
      debugShowCheckedModeBanner: false,
      home: Home(),
    ),
  ); */
  runApp(
    /**
     * Utilizando o multiprovider, é possível criar mais de um 
     * observável para uma instância de uma classe
     */
    MultiProvider(
      providers: [
        Provider(create: (_) => Controller()),
      ],
      child: MaterialApp(
        title: 'Observable List',
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    ),
  );
}
