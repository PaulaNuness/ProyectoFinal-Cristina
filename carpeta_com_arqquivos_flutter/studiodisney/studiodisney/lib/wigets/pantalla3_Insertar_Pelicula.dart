import 'package:flutter/material.dart';
import 'package:studiodisney/wigets/pantalla2_aplicacion.dart';

class pantalla3_insertarPelicula extends StatefulWidget {
  @override
  _pantalla4_insertarActor createState() => _pantalla4_insertarActor();
}

class _pantalla4_insertarActor extends State<pantalla3_insertarPelicula> {
  TextEditingController _fraseController1 = TextEditingController();
  TextEditingController _fraseController2 = TextEditingController();
  TextEditingController _fraseController3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('INSERTAR ACTOR'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _fraseController1,
              decoration: InputDecoration(labelText: 'Inserir id_actor'),
            ),
            TextField(
              controller: _fraseController2,
              decoration: InputDecoration(labelText: 'Inserir id_pelicula'),
            ),
            TextField(
              controller: _fraseController3,
              decoration: InputDecoration(labelText: 'Inserir nombre actor'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Pantalla2_aplicacion(),
                              ),
                            );
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(54, 244, 219, 1), // Cor do botão
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: Text(
                'CONFIRMAR',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _fraseController1.dispose();
    _fraseController2.dispose();
    _fraseController3.dispose();
    super.dispose();
  }
}