import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:i_show_app/widgets/BotaoCustomizado.dart';
import 'package:i_show_app/widgets/InputCustomizado.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _blurAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<double> _widthAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _blurAnimation = Tween(
      begin: 5.0,
      end: 0.0,
    ).animate(
      // Permite definir o controller de animação com uma curva específica
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    );

    _opacityAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutQuint,
      ),
    );

    _widthAnimation = Tween(
      begin: 0.0,
      end: 500.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.decelerate,
      ),
    );

    _controller.forward();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Aplica efeito de camera lenta na aplicação
    timeDilation = 6; 

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            AnimatedBuilder(
              animation: _blurAnimation,
              builder: (_, __) => Container(
                height: 400,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/fundo.png'),
                  ),
                ),
                child: BackdropFilter(
                  /**
                   * Aplica efeito de blur
                   */
                  filter: ImageFilter.blur(
                    sigmaX: _blurAnimation.value,
                    sigmaY: _blurAnimation.value,
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 10,
                        child: FadeTransition(
                          opacity: _opacityAnimation,
                          child: Image.asset('assets/images/detalhe1.png'),
                        ),
                      ),
                      Positioned(
                        left: 50,
                        child: FadeTransition(
                          opacity: _opacityAnimation,
                          child: Image.asset('assets/images/detalhe2.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: AnimatedBuilder(
                animation: _widthAnimation,
                builder: (_, __) => Container(
                  width: _widthAnimation.value,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const InputCustomizado(
                          icone: Icon(Icons.person),
                          label: 'E-mail',
                        ),
                        const InputCustomizado(
                          isSenha: true,
                          icone: Icon(Icons.lock_rounded),
                          label: 'Senha',
                        ),
                        const SizedBox(height: 20),
                        BotaoCustomizado(
                          onTap: () {},
                          controller: _controller,
                          label: 'Entrar',
                        ),
                        const SizedBox(height: 10),
                        FadeTransition(
                          opacity: _opacityAnimation,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Esqueci minha senha!',
                              style: TextStyle(
                                color: Color.fromRGBO(255, 100, 127, 1),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
