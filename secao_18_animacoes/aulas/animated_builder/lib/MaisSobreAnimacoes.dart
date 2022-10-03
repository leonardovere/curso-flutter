import 'package:flutter/material.dart';

class MaisSobreAnimacoes extends StatefulWidget {
  const MaisSobreAnimacoes({Key? key}) : super(key: key);

  @override
  _MaisSobreAnimacoesState createState() => _MaisSobreAnimacoesState();
}

class _MaisSobreAnimacoesState extends State<MaisSobreAnimacoes>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..forward();

    _animation = Tween(
      begin: 0.0,
      end: 60.0,
    ).animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mais sobre animações'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: AnimatedBuilder(
          animation: _animation,
          child: Image.asset(
            'assets/images/logo.png',
            width: 180,
            height: 180,
            fit: BoxFit.contain,
          ),
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(_animation.value, _animation.value),
              child: child!,
            );

            /* return Transform.scale(
              scale: _animation.value as double,
              child: child!,
            ); */

            /* return Transform.rotate(
              angle: _animation.value as double,
              child: child!,
            ); */
          },
        ),
      ),
    );
  }
}
