import 'package:flutter/material.dart';

class CriandoAnimacoesBasicas extends StatefulWidget {
  @override
  _CriandoAnimacoesBasicasState createState() =>
      _CriandoAnimacoesBasicasState();
}

class _CriandoAnimacoesBasicasState extends State<CriandoAnimacoesBasicas> {
  bool _status = true;

  void _mudarStatus() {
    setState(() {
      _status = !_status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meu App'),
        ),
        /* body: AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.bounceIn,
          padding: EdgeInsets.only(bottom: 100, top: 20),
          alignment: _status ? Alignment.topCenter : Alignment.bottomCenter,
          color: Colors.blue[600],
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 900),
            opacity: _status ? 1 : 0,
            child: Container(
              height: 50,
              child: Icon(
                Icons.airplanemode_active,
                size: 50,
                color: Colors.white,
              ),
            ),
          ),
        ), */
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: _mudarStatus,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 250),
                  alignment: Alignment.center,
                  width: _status ? 200 : 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Stack(
                    children: [
                      AnimatedOpacity(
                        duration: Duration(milliseconds: 300),
                        opacity: _status ? 1 : 0,
                        child: Center(
                          child: Text(
                            "Adicionar",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      AnimatedOpacity(
                        duration: Duration(milliseconds: 300),
                        opacity: _status ? 0 : 1,
                        child: Center(
                          child: Icon(
                            Icons.add_a_photo,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
          elevation: 6,
          child: Icon(Icons.add_box),
          onPressed: _mudarStatus,
        ),
      ),
    );
  }
}
