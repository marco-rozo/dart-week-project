import 'package:flutter/material.dart';
import 'package:app_filmes/application/ui/theme_extensions.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Favoritos', style: TextStyle(color: Color(0xff222222)),),
      ),
      body: Text('Favoritos page'),
    );
  }
}
