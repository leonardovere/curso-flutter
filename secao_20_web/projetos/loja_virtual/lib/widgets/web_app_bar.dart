import 'package:flutter/material.dart';

class WebAppBar extends StatelessWidget {
  const WebAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Image.asset(
            "assets/images/logo.png",
            fit: BoxFit.contain,
          ),
          Expanded(child: Container()),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  color: Colors.white,
                  icon: Icon(Icons.search),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart_rounded)),
          SizedBox(width: 10),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.lightBlueAccent,
              primary: Colors.white,
              padding: EdgeInsets.all(20),
            ),
            onPressed: () {},
            child: Text('Cadastrar'),
          ),
          SizedBox(width: 10),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.orange,
              primary: Colors.white,
              padding: EdgeInsets.all(20),
            ),
            onPressed: () {},
            child: Text('Entrar'),
          ),
        ],
      ),
    );
  }
}
