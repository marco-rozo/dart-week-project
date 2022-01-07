import 'package:app_filmes/models/movie_detail_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MovieDetailHeader extends StatelessWidget {
  final MovieDetailModel? movie;

  const MovieDetailHeader({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var movieData = movie;

    print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
    print(movieData?.urlImages);
    print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
    if (movieData != null && movieData.urlImages.length > 0) {
      return SizedBox(
        height: 278,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movieData.urlImages.length,
          itemBuilder: (context, index) {
            final image = movieData.urlImages[index];
            print('bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb');
            print(movieData.urlImages);
            print('bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb');
            return Padding(
              padding: EdgeInsets.all(2.0),
              child: CachedNetworkImage(
                imageUrl: image ?? 'https://via.placeholder.com/278',
                placeholder: (context, url) => SizedBox(
                  height: 278,
                  width: 278,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              // Image.network(image ?? 'https://via.placeholder.com/278'),
            );
          },
        ),
      );
    } else {
      return SizedBox.shrink();
    }
  }
}
