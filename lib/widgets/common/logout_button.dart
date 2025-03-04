import 'package:conectadas_app/service/auth_service.dart';
import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.exit_to_app),
      tooltip: 'Logout',
      onPressed: () async {
        await _handleLogout(context);
      },
    );
  }

  Future<void> _handleLogout(BuildContext context) async {
    //final authService = AuthService();
    await AuthService.logout();

    // Redireciona para a tela de home/remover histórico de navegação
    Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
  }
}
