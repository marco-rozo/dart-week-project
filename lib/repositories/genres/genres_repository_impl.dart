
import 'package:app_filmes/application/rest_client/rest_client.dart';
import 'package:app_filmes/models/genre_model.dart';
import 'package:app_filmes/repositories/genres/genres_repository.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class GenresRepositoryImpl implements GenresRepository{

  final RestClient _restClient;

  GenresRepositoryImpl({
    required RestClient restClient
  }) : _restClient = restClient;

  @override
  Future<List<GenreModel>> getGenres() async {
    final result = await _restClient.get<List<GenreModel>>(
      '/genre/movie/list',
      query: {
        'api_key' : RemoteConfig.instance.getString('api_token'),
        'language' : 'pt-br'
      },
      decoder: (data) {
        //pega os dados do array "genres"
        final resultData = data['genres'];
        //verifica se tem dados
        if (resultData != null) {
          //transforma a lista de CHAVExVALOR (JSON) no model GenreModel
          return resultData.map<GenreModel>((g) => GenreModel.fromMap(g)).toList();
        } else{
          //se for vazio retorna nulo
          return <GenreModel>[];
        }
      },
    );

    //apos executar o acesso verifica se possui algumm erro
    if(result.hasError){
      print('Erro ao buscar Genres [${result.statusText}]');
      throw Exception('Erro ao buscar Genres');
    }

    return result.body ?? <GenreModel>[];
  }

}

