import 'package:app_filmes/application/ui/theme_extensions.dart';
import 'package:flutter/material.dart';

class FilterTag extends StatelessWidget {
  const FilterTag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      constraints: BoxConstraints(minWidth: 100, minHeight: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: context.themeRed
      ),
      child: Align(
          alignment: Alignment.center,
          child: Text('Infantil', style: TextStyle(color: Colors.white, fontSize: 14),)
      ),
    );
  }
}
