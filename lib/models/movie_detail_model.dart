import 'dart:convert';

import 'package:app_filmes/models/cast_model.dart';
import 'package:app_filmes/models/genre_model.dart';

class MovieDetailModel {
  final String title;
  final double stars;
  final List<GenreModel> genres;
  final List<dynamic> urlImages;
  final DateTime releaseDate;
  final String overview;
  final List<String> productionCompanies;
  final String originalLanguage;
  final List<CastModel> cast;
  final String runtime;
  
  MovieDetailModel({
    required this.title,
    required this.stars,
    required this.genres,
    required this.urlImages,
    required this.releaseDate,
    required this.overview,
    required this.productionCompanies,
    required this.originalLanguage,
    required this.cast,
    required this.runtime,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'stars': stars,
      'genres': genres.map((x) => x.toMap()).toList(),
      'images': urlImages,
      'releaseDate': releaseDate.millisecondsSinceEpoch,
      'overview': overview,
      'productionCompanies': productionCompanies,
      'originalLanguage': originalLanguage,
      'cast': cast.map((x) => x.toMap()).toList(),
      'runtime': runtime,
    };
  }



  factory MovieDetailModel.fromMap(Map<String, dynamic> map) {

    String durationToString(int minutes) {
      var d = Duration(minutes:minutes);
      List<String> parts = d.toString().split(':');
      return '${parts[0].padLeft(2, '0')}h${parts[1].padLeft(2, '0')}';
    }

    List urlImagesPosters = map['images']['posters'];
    var urlImages = [];
    if(urlImagesPosters.isNotEmpty){
       urlImagesPosters.map((i) => urlImages.add('https://image.tmdb.org/t/p/w200${i['file_path']}')).toList();
    } else{
      urlImages.add('https://image.tmdb.org/t/p/w200${map['poster_path']}');
    }



    return MovieDetailModel(
      title: map['title'] ?? '',
      stars: map['vote_average']?.toDouble() ?? 0.0,
      genres: List<GenreModel>.from(map['genres']?.map((x) => GenreModel.fromMap(x)) ?? const []),
      urlImages: urlImages,
      releaseDate: DateTime.parse(map['release_date']),
      overview: map['overview'] ?? '',
      productionCompanies: List<dynamic>.from(map['production_companies'] ?? const []).map<String>((p) => p['name']).toList(),
      originalLanguage: map['original_language'] ?? '',
      cast: List<CastModel>.from(map['credits']['cast']?.map((x) => CastModel.fromMap(x)) ?? const []),
      runtime: durationToString(map['runtime']),
    );
  }
  String toJson() => json.encode(toMap());

  factory MovieDetailModel.fromJson(String source) => MovieDetailModel.fromMap(json.decode(source));
}
