import 'package:get/get.dart';

class SplashController extends GetxController{

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    Get.offAllNamed('/login');
  }
}