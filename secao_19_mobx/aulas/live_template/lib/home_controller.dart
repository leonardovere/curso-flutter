import 'package:mobx/mobx.dart';
part "home_controller.g.dart";

// $ cria variáveis
// dois $, significa que ao gerar o snipet, só será considerado 1
class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {

}