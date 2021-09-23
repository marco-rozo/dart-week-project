import 'package:flutter/material.dart';
import 'package:app_filmes/application/ui/theme_extensions.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Favoritos',),
      ),
      body: Text('Favoritos page'),
    );
  }
}
