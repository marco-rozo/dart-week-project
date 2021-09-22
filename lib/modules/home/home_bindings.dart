import 'package:app_filmes/modules/home/home_controller.dart';
import 'package:get/get.dart';
 
class HomeBindings extends Bindings {
  @override 
  void dependencies() {
    //manter a HomeController ativa com "fenix: true"
    Get.lazyPut(() => HomeController(loginService: Get.find()), fenix: true);
  } 
}