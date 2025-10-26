import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomDialog {
  /// Exibe o diálogo recebendo o e-mail dinamicamente
  static void show(BuildContext context, String email) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Animação Lottie
              Lottie.asset(
                'assets/animations/Sending Email.json',
                width: 240,
                height: 180,
                repeat: true,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 15),
              const Text(
                'Confirme seu endereço de e-mail',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Enviamos um e-mail de confirmação para:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                email,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 15),
              const Text(
                'Verifique seu e-mail e clique no link de confirmação para continuar.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            SizedBox(
              width: 220, // largura fixa
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  // Aqui você pode chamar uma função para reenviar o e-mail, se quiser
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Reenviar e-mail',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
