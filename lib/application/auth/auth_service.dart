import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthService extends GetxService{
  User? user;

  void init(){
    // FirebaseAuth.instance.signOut();

    //estrutura para "escutar" as alterações da autenticação do usuário no Firebase
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      //guarda o usuario
      this.user = user;
      //verifica se o usuario esta ou não logado e direciona
      if(user == null){
        Get.offAllNamed('/login');
      } else{
        Get.offAllNamed('/home');
      }
    });
  }
}