import 'package:flutter/material.dart';
import 'package:studiodisney/wigets/pantalla1_inicio.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,//a faiza vermelha que aparece, esta a falso
      //theme: ThemeData.dark(),//a pantalla estara con fundo negro
      home: Pantalla1_inicio(),// a primera pantalla que ira cargar
    );
  }
}


