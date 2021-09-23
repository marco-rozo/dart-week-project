
import 'package:app_filmes/application/rest_client/rest_client.dart';
import 'package:app_filmes/models/genre_model.dart';
import 'package:app_filmes/models/genre_model.dart';
import 'package:app_filmes/repositories/genres/genres_repository.dart';
import 'package:flutter/material.dart';

class GenresRepositoryImpl implements GenresRepository{

  final RestClient _restClient;

  GenresRepositoryImpl({
    required RestClient restClient
  }) : _restClient = restClient;

  @override
  Future<List<GenreModel>> getGenres() async {
    final result = await _restClient.get<List<GenreModel>>(
      '/genre/movie/list',
      decoder: (data) {1
        final resultData = data['genres'];
        if (resultData != null) {
          return resultData.map<GenreModel>((g) => GenreModel.fromMap(g)).toList();
        }
        return <GenreModel>[];
      },
    );

    if(result.hasError){
      print(result.statusText);
      throw Exception('Erro ao buscar Genres');
    }

    return result.body ?? <GenreModel>[];
  }

}

