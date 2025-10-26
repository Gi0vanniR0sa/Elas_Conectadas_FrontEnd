import 'package:conectadas_app/service/auth_service.dart';
import 'package:conectadas_app/service/shared_service.dart';
import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  final Future<void> Function()? onPressed;

  const LogoutButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.exit_to_app),
      tooltip: 'Logout',
      onPressed: () async {
        if (onPressed != null) {
          await onPressed!();
        } else {
          // Comportamento padrão: logout e redireciona para login
          await _handleLogout(context);
        }
      },
    );
  }

  Future<void> _handleLogout(BuildContext context) async {
    await SharedService.logoutAndRedirect(context);
  }
}

