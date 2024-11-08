import 'package:conectadas_app/pages/auth/register.dart';
import 'package:flutter/material.dart';

import '../pages/auth/login.dart';

//Faz a troca de páginas entre login e registro
class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});
  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}
class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPageView = true;
  void togglePages(){
    setState(() {
      showLoginPageView = !showLoginPageView;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showLoginPageView){
      return LoginPage(onTap: togglePages);
    }else{
      return RegisterPage(onTap: togglePages);
    }
  }
}