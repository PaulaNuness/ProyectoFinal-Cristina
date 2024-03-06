import 'package:flutter/material.dart';
import 'package:studiodisney/wigets/pantalla1_inicio.dart';
import 'package:studiodisney/wigets/pantalla3_Insertar_Pelicula.dart';
import 'package:studiodisney/wigets/pantalla4_Insertar_Actor.dart';
import 'package:studiodisney/wigets/pantalla5_Insertar_Director.dart';

class Pantalla2_aplicacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PELICULAS DISNEY'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Contêiner com borda e botões no primeiro conjunto
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10), // Espaçamento lateral
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 216, 111, 198),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        'Insertar',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      pantalla3_insertarPelicula(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary:
                                  Color.fromARGB(255, 216, 111, 198),
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(15),
                            ),
                            child: Column(
                              children: [
                                Icon(Icons.add, size: 30),
                                Text('Pelicula'),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      pantalla4_insertarActor(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary:
                                  Color.fromARGB(255, 216, 111, 198),
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(15),
                            ),
                            child: Column(
                              children: [
                                Icon(Icons.add, size: 30),
                                Text('Actor'),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      pantalla5_insertarDirector(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary:
                                  Color.fromARGB(255, 216, 111, 198),
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(15),
                            ),
                            child: Column(
                              children: [
                                Icon(Icons.add, size: 30),
                                Text('Director'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20), // Espaço entre os contêineres
              // Contêiner com borda e botões no segundo conjunto
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10), // Espaçamento lateral
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 138, 206, 238),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Text(
                      'Actualizar',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                               Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      pantalla3_insertarPelicula(),
                                ),
                              );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 138, 206, 238),
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(15),
                          ),
                          child: Column(
                            children: [
                              Icon(Icons.refresh, size: 30),
                              Text('Pelicula'),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      pantalla4_insertarActor(),
                                ),
                              );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 138, 206, 238),
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(15),
                          ),
                          child: Column(
                            children: [
                              Icon(Icons.refresh, size: 30),
                              Text('Actor'),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    pantalla5_insertarDirector(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 138, 206, 238),
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(15),
                          ),
                          child: Column(
                            children: [
                              Icon(Icons.refresh, size: 30),
                              Text('Director'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20), // Espaço entre os contêineres
              // Contêiner com borda e botões no terceiro conjunto
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10), // Espaçamento lateral
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 160, 235, 182),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Text(
                      'Borrar',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    pantalla3_insertarPelicula(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 160, 235, 182),
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(15),
                          ),
                          child: Column(
                            children: [
                              Icon(Icons.delete, size: 30),
                              Text('Pelicula'),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    pantalla4_insertarActor(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 160, 235, 182),
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(15),
                          ),
                          child: Column(
                            children: [
                              Icon(Icons.delete, size: 30),
                              Text('Actor'),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    pantalla5_insertarDirector(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 160, 235, 182),
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(15),
                          ),
                          child: Column(
                            children: [
                              Icon(Icons.delete, size: 30),
                              Text('Director'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20), // Espaço entre os contêineres
              // Contêiner com borda e botões no quarto conjunto
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10), // Espaçamento lateral
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 235, 223, 133),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Text(
                      'Listar',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Pantalla1_inicio(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 230, 223, 169),
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(15),
                          ),
                          child: Column(
                            children: [
                              Icon(Icons.list, size: 30),
                              Text('Pelicula'),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    pantalla4_insertarActor(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 230, 223, 169),
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(15),
                          ),
                          child: Column(
                            children: [
                              Icon(Icons.list, size: 30),
                              Text('Actor'),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    pantalla5_insertarDirector(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 230, 223, 169),
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(15),
                          ),
                          child: Column(
                            children: [
                              Icon(Icons.list, size: 30),
                              Text('Director'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10), // Espaço entre os contêineres e o novo Container
              // Contêiner com borda e botões no último conjunto
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10), // Espaçamento lateral
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 233, 139, 126),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: double.infinity, // Ocupa toda a largura disponível
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Pantalla1_inicio(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary:
                              Color.fromARGB(255, 233, 139, 126), // Cor do botão
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(15),
                        ),
                        child: Column(
                          children: [
                            Icon(Icons.check, size: 30),
                            Text('Salir'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
