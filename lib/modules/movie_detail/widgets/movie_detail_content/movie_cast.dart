import 'package:app_filmes/models/cast_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:app_filmes/application/ui/theme_extensions.dart';

class MovieCast extends StatelessWidget {
  final CastModel? cast;
  const MovieCast({Key? key, this.cast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
                imageUrl: '${cast!.image}',
                placeholder: (context, url) => SizedBox(
                  height: 85,
                  width: 85,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            /*Image.network(
              cast?.image ?? 'https://via.placeholder.com/85',
              width: 85,
              height: 85,
              fit: BoxFit.cover,
            ),*/
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            cast?.name ?? '',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            cast?.character ?? '',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: context.themeGray,
            ),
          ),
        ],
      ),
    );
  }
}
