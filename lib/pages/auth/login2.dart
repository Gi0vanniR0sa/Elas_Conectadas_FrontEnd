import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagem de fundo
          Image.asset(
            'assets/Background/waves-wallpaper-3840x2160-surf-shoreline-25991.jpg',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          // Texto centralizado
          Center(
            child: Text(
              'Elas conectam',
              style: TextStyle(
                fontFamily: 'Mark_Script',
                fontSize: 50,
                fontWeight: FontWeight.w200,
                color: Colors.white, // Para aparecer sobre a imagem
              ),
            ),
          ),
        ],
      ),
    );
  }
}
