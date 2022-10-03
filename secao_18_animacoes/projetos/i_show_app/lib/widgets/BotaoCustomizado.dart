import 'package:flutter/material.dart';

class BotaoCustomizado extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  final AnimationController controller;

  late Animation<double> animacaoLargura;
  late Animation<double> animacaoAltura;
  late Animation<double> animacaoRadius;
  late Animation<double> animacaoOpacidade;

  // ignore: use_key_in_widget_constructors
  BotaoCustomizado({
    required this.onTap,
    required this.label,
    required this.controller,
  }) {
    animacaoLargura = Tween(
      begin: 0.0,
      end: 500.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        // Definindo interval, pode ser usado tempos para execução de animações
        curve: const Interval(0.2, 1, curve: Curves.easeIn),
      ),
    );

    animacaoAltura = Tween(
      begin: 0.0,
      end: 60.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        // Definindo interval, pode ser usado tempos para execução de animações
        curve: const Interval(0.4, 0.7, curve: Curves.easeIn),
      ),
    );

    animacaoRadius = Tween(
      begin: 0.0,
      end: 10.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        // Definindo interval, pode ser usado tempos para execução de animações
        curve: const Interval(0.6, 1, curve: Curves.easeIn),
      ),
    );

    animacaoOpacidade = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        // Definindo interval, pode ser usado tempos para execução de animações
        curve: const Interval(0.6, 0.8, curve: Curves.easeIn),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animacaoLargura,
      builder: (_, __) => InkWell(
        onTap: onTap,
        child: Container(
          height: animacaoAltura.value,
          width: animacaoLargura.value,
          child: Center(
            child: FadeTransition(
              opacity: animacaoOpacidade,
              child: Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(animacaoRadius.value),
            gradient: const LinearGradient(
              colors: [
                Color.fromRGBO(255, 100, 127, 1),
                Color.fromRGBO(255, 123, 145, 1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
