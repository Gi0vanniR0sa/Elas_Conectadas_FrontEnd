import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:conectadas_app/widgets/common/text_field_widget.dart';
import 'package:conectadas_app/service/api_service.dart'; // <- para requisições à API

class VerifyOtp extends StatefulWidget {
  final String email;

  const VerifyOtp({super.key, required this.email});

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  final TextEditingController _otpController = TextEditingController();
  bool _isLoading = false;

  /// 🔹 Envia o código de verificação para o servidor
  Future<void> verifyOtp() async {
    final otp = _otpController.text.trim();

    if (otp.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, insira o código OTP')),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final response = await APIService.verifyOtp(widget.email, otp);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response['message'] ?? 'Conta verificada!')),
      );

      // Redirecionar para login após sucesso
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacementNamed('/home');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao verificar: $e')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  /// 🔹 Reenvia o código OTP para o e-mail
  Future<void> resendOtp() async {
    setState(() => _isLoading = true);
    try {
      final response = await APIService.requestOtp(widget.email);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response['message'] ?? 'Código reenviado!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao reenviar: $e')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffbf5fc),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset(
                    'assets/animations/OTP Verify.json',
                    width: 300,
                    height: 300,
                    repeat: true,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Verificação de conta',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'INTER_18PT',
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Padding(
                    padding: EdgeInsets.only(top: 24, left: 22, right: 22),
                    child: Text(
                      'Quase lá! Enviamos um e-mail de confirmação para:',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'POPPINS',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      widget.email,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'POPPINS',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22),
                    child: Text(
                      'Verifique seu e-mail e insira o código de confirmação para continuar.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'POPPINS',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // 🔹 Campo OTP
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                    child: SizedBox(
                      width: 200,
                      child: TextField(
                        controller: _otpController,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          hintText: 'Digite o código',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // 🔹 Botão de confirmar
                  ElevatedButton(
                    onPressed: _isLoading ? null : verifyOtp,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff985adb),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 14),
                    ),
                    child: _isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(
                            'Confirmar',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'POPPINS',
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                  ),

                  const SizedBox(height: 15),

                  // 🔹 Link para reenviar
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 42, vertical: 8),
                    child: GestureDetector(
                      onTap: _isLoading ? null : resendOtp,
                      child: const Text.rich(
                        TextSpan(
                          text: 'Não recebeu o código? ',
                          style: TextStyle(
                            fontFamily: 'POPPINS',
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                          children: [
                            TextSpan(
                              text: 'Reenviar código',
                              style: TextStyle(
                                color: Color(0xff985adb),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
