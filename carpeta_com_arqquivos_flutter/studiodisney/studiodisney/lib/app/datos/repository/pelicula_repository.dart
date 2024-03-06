import 'dart:convert';
import 'package:studiodisney/app/datos/entidades/pelicula.dart';
import 'package:studiodisney/app/datos/http/excecoes.dart';
import 'package:studiodisney/app/datos/http/http_cliente.dart';


abstract class IPeliculaReposity {
  Future<List<Pelicula>> getPeliculas();
}

class PeliculaRepository implements IPeliculaReposity {
  final IHttpClient client;

  PeliculaRepository({required this.client});

  @override
  Future<List<Pelicula>> getPeliculas() async {
    final response = await client.get(
      url: 'http://localhost:8000/peliculas/todas_las_peliculas',
    );

    if (response.statusCode == 200) {
      final List<Pelicula> peliculas = [];

      final body = jsonDecode(response.body);

      body['products'].map((item) {
        final Pelicula produto = Pelicula.fromMap(item);
        peliculas.add(produto);
      }).toList();

      return peliculas;
    } else if (response.statusCode == 404) {
      throw NotFoundException('A url informada não é válida');
    } else {
      throw Exception('Não foi possível carregar os produtos');
    }
  }
}