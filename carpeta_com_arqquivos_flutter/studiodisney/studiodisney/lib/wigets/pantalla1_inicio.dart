import 'package:flutter/material.dart';
import 'package:studiodisney/wigets/pantalla2_aplicacion.dart';

class Pantalla1_inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PELICULAS DISNEY'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Pantalla2_aplicacion(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.blue, // Cor do botão
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          ),
          child: Text(
            'ENTRAR',
            style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Sans-serif',
                      ),
          ),
        ),
      ),
    );
  }
}
