import 'package:app_filmes/models/movie_detail_model.dart';
import 'package:flutter/material.dart';

class MovieDetailContentCredits extends StatelessWidget {
  final MovieDetailModel? movie;

  MovieDetailContentCredits({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.timer, size: 20,),
              SizedBox(
                width: 5,
              ),
              Text(
                movie?.runtime ?? '',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(minHeight: 50),
            child: Text(
              movie?.overview ?? '',
              style: TextStyle(fontSize: 14, height: 1.3),
              //todo 1:02 aula 6
            ),
          )
        ],
      ),
    );
  }
}
