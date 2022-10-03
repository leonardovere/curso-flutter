import 'package:mobx/mobx.dart';
part "teste.g.dart";

// $ cria variáveis
// dois $, significa que ao gerar o snipet, só será considerado 1
class Teste = TesteBase with _$Teste;

abstract class TesteBase with Store {

}