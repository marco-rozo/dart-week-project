import 'package:app_filmes/modules/movies/movies_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesHeader extends GetView<MoviesController> {
  const MoviesHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 196,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
              width: Get.width,
              child: Image.asset('assets/images/header.png', fit: BoxFit.cover,)
          ),
          Container(
            width: Get.width * .9,
            padding: EdgeInsets.only(bottom: 20),
            child: TextField(
              //resgata o valor escrito e passa para a função de filtro da controller
              onChanged: (value) => controller.filterByName(value),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(
                    color: Colors.grey
                  )
                ),
                fillColor: Colors.white,
                filled: true,
                labelText: 'Procurar filmes',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                prefixIcon: Icon(Icons.search, color: Colors.grey,),
                contentPadding: EdgeInsets.zero,
                labelStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.grey
                ),
                focusColor: Colors.grey,
                hoverColor: Colors.grey
              ),
            ),
          )
        ],
      ),
    );
  }
}
