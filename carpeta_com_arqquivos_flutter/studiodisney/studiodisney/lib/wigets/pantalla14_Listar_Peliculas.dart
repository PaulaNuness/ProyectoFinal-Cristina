import 'package:flutter/material.dart';
import 'package:studiodisney/app/datos/entidades/pelicula.dart';
import 'package:studiodisney/app/datos/http/excecoes.dart';
import 'package:studiodisney/app/datos/repository/pelicula_repository.dart';

class PeliculaStore {
  final IPeliculaReposity repository;

  // Variável reativa para o loading
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  // Variável reativa para o state
  final ValueNotifier<List<Pelicula>> state =
      ValueNotifier<List<Pelicula>>([]);

  // Variável reativa para o erro
  final ValueNotifier<String> erro = ValueNotifier<String>('');

  PeliculaStore({required this.repository});

  Future getProdutos() async {
    isLoading.value = true;

    try {
      final result = await repository.getPeliculas();
      state.value = result;
    } on NotFoundException catch (e) {
      erro.value = e.message;
    } catch (e) {
      erro.value = e.toString();
    }

    isLoading.value = false;
  }
}