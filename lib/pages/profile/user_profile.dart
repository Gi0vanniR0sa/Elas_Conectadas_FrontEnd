import 'package:conectadas_app/pages/profile/conectar_button.dart';
import 'package:conectadas_app/widgets/common/bottom_bar.dart';
import 'package:conectadas_app/widgets/common/custom_header.dart';
import 'package:conectadas_app/widgets/common/logout_button.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget{
  const UserPage({super.key});
  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final String name = 'Ana Maria'; // Substitua pelo nome do usuário
  final String userOccupation = 'Crocheteira'; // Substitua pela ocupação do usuário
  final String avatarImagePath = 'assets/avatar.jpeg'; // Substitua pelo caminho da imagem do usuário
  final String phone = '43991575544'; // Substitua pelo número de telefone do usuário

  /*@override
  void initState() {
    super.initState();
    checkUserStatus();
  }
  final AuthService authService = AuthService();
  Future<void> checkUserStatus() async {
    bool loggedIn = await authService.isLoggedIn();

    if (!loggedIn) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginOrRegister()),
      );
    } else{
      loggedIn = true;
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppHeader(
          title: Text(name, style: const TextStyle(color: Colors.white),),
          appBar: AppBar(),
          widgets: const <Widget>[const Icon(Icons.menu),],

          /*LogoutButton()*/
      ),

      body:
        SingleChildScrollView(
          child: Column( crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 15.0),

              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          //backgroundImage: AssetImage(avatarImagePath),
                        ),
                        Text(
                            "name",
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                            "userOccupation",
                            style: const TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        const SizedBox(height: 10),

                        //Botão de conectar
                        ConectarButton(phone: phone),
                        const SizedBox(height: 10),
                      ],
                    ),
                    
                  ],
                ),
              ),

              
              const SizedBox(height: 16),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 0,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sobre Mim',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Sou uma empreendedora talentosa no crochê, compartilhando suas criações e dicas em suas redes sociais.',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                
                //Botão de logout
                LogoutButton(),//apenas para debug
              ],
            ),
      ),
      bottomNavigationBar: AppBottomTabs(),
    );
  }
}