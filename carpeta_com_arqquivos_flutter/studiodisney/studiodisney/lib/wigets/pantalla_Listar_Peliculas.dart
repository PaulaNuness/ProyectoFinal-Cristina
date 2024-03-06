import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:studiodisney/entidades/pelicula.dart';


class MovieListScreen extends StatefulWidget {
  @override
  _MovieListScreenState createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  List<Pelicula> _peliculas = [];

  @override
  void initState() {
    super.initState();
    _getPeliculas();
  }

  Future<void> _getPeliculas() async {
    try {
      final response = await http.get('http://localhost:8000/peliculas/todas_las_peliculas' as Uri);
      if (response.statusCode == 200) {
        var decodedJson = jsonDecode(response.body);
        List<Pelicula> peliculas = (decodedJson as List)
            .map<Pelicula>((json) => Pelicula.fromJson(json))
            .toList();
        setState(() {
          _peliculas = peliculas;
        });
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Películas'),
      ),
      body: _buildMovieList(),
    );
  }

  Widget _buildMovieList() {
    if (_peliculas.isEmpty) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView.builder(
        itemCount: _peliculas.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_peliculas[index].nombre),
            subtitle: Text(_peliculas[index].genero),
          );
        },
      );
    }
  }
}


