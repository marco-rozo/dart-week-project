import 'package:app_filmes/application/modules/modules.dart';
import 'package:app_filmes/modules/login/logn_bindings.dart';
import 'package:get/get.dart';

import 'login_page.dart';

class LoginModule extends Module{
  @override
  List<GetPage>routers = [
      GetPage(
          name: '/login',
          page: () => LoginPage(),
          binding: LoginBindings()
      ),
  ];


}