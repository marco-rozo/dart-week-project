import 'package:app_filmes/application/ui/filmes_app_ui_config.dart';
import 'package:app_filmes/modules/splash/splash_module.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'application/bindings/application_bindings.dart';
import 'modules/home/home_module.dart';
import 'modules/login/login_module.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  RemoteConfig.instance.fetchAndActivate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: FilmesAppUIConfig.title,
      debugShowCheckedModeBanner: false,
      initialBinding: ApplicationBindings(),
      theme: FilmesAppUIConfig.theme,
      darkTheme: ThemeData.dark(),
      color: Colors.purple,
      getPages: [
        ...SplashModule().routers,
        ...LoginModule().routers,
        ...HomeModule().routers,
      ],
    );
  }
}