import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

//RESPONSÁVEL POR CONECTAR O USUÁRIO AO WHATSAPP
class ConectarButton extends StatelessWidget {
  final String phone;

  const ConectarButton({super.key, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Center(
          child: ElevatedButton(
            onPressed: () async {
              var whatsAppNumber = '55$phone';
              var whatsAppUrl =
                  'whatsapp://send?phone=$whatsAppNumber&text=Hello';
              await launchUrl(Uri.parse(whatsAppUrl));
            },
            child: const Text(
                  'Conectar',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
        );
  }
}