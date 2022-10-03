import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:olx/routes/RouteGenerator.dart';

ThemeData temaPadrao = ThemeData(
  primaryColor: Color(0xff9c27b0),
  accentColor: Color(0xff7b1fa2),
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MaterialApp(
      title: "OLX",
      debugShowCheckedModeBanner: false,
      theme: temaPadrao,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    ),
  );
}
