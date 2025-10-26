import 'dart:convert';

import 'package:conectadas_app/models/register_request_model.dart';
import 'package:conectadas_app/pages/auth/login.dart';
import 'package:conectadas_app/pages/auth/verifyotp.dart';
import 'package:conectadas_app/service/api_service.dart';
import 'package:conectadas_app/utils/config.dart';
import 'package:conectadas_app/utils/date_formatter.dart';
import 'package:conectadas_app/utils/phone_num_formatter.dart';
import 'package:conectadas_app/widgets/auth/custom_textfield.dart';
import 'package:conectadas_app/widgets/common/custom_button.dart';
import 'package:conectadas_app/widgets/common/theme_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Controllers para cada campo do formulário
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _dobController = TextEditingController();

  // Chave global para validação do formulário
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Controle de carregamento da tela
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    // Bloqueia a orientação da tela para retrato
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  void dispose() {
    // Limpa os controllers para liberar memória
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  /// Valida todos os campos do formulário
  bool validateForm() {
    final form = _formKey.currentState;
    if (form != null && form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  /// Método principal para realizar o registro
  void signUp() async {
    if (!validateForm()) {
      // Se houver campos vazios, exibe uma mensagem e retorna
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, preencha todos os campos!')),
      );
      return;
    }

    // Cria o modelo de requisição com os dados do formulário
    final model = RegisterRequestModel(
      email: _emailController.text.trim(),
      name: _nameController.text.trim(),
      password: _passwordController.text.trim(),
      phone: _phoneController.text.trim(),
      dob: _dobController.text.trim(),
    );

    setState(() {
      isLoading = true; // Ativa indicador de carregamento
    });

    try {
      // Chama o serviço de registro da API
      final response = await APIService.register(model);

      if (response.id != null) {
        // Cadastro bem-sucedido: mostra SnackBar e redireciona para LoginPage
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registrado com sucesso! Verifique a sua conta.')),
        );

        // Aguarda 1 segundo antes de redirecionar para a tela de login
        await Future.delayed(const Duration(seconds: 1));

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => VerifyOtp(email: _emailController.text.trim())),
        );
      } else {
        // Caso a API retorne erro, exibe mensagem
        _showAlertDialog(
          title: "Erro no registro",
          message: response.message ?? "Falha ao registrar usuário",
        );
      }
    } catch (e) {
      // Captura qualquer exceção inesperada
      _showAlertDialog(
        title: "Erro inesperado",
        message: "$e",
      );
    } finally {
      setState(() {
        isLoading = false; // Desativa indicador de carregamento
      });
    }
  }

  /// Exibe um diálogo de alerta com título e mensagem
  void _showAlertDialog({
    required String title,
    required String message,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Ok"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const <Widget>[
          ThemeSwitch(),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 25.0, vertical: 80.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo do aplicativo
                    const Image(image: AssetImage("assets/images/elas.png")),
                    const SizedBox(height: 20.0),

                    // Campos de formulário
                    CustomTextField(
                      controller: _emailController,
                      label: 'Email',
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira uma seu e-mail atual';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 7.0),
                    CustomTextField(
                        controller: _nameController,
                        label: 'Nome',
                        obscureText: false, 
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira seu nome';
                          }
                          return null;
                        },
                      ), 
                    const SizedBox(height: 7.0),
                    CustomTextField(
                        controller: _passwordController,
                        label: 'Senha',
                        isPassword: true,
                        obscureText: true, 
                        validator: (value) {
                          if(value == null || value.isEmpty) {
                            return 'Por favor, insira sua senha';
                          }
                          return null;
                        }
                      ),
                    const SizedBox(height: 7.0),
                    CustomTextField(
                      controller: _phoneController,
                      label: 'Celular',
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        PhoneNumFormatter()
                      ],
                      validator: (value) {
                        if(value == null || value.isEmpty) {
                          return 'Por favor, insira seu número atual';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 7.0),
                    CustomTextField(
                      controller: _dobController,
                      label: 'Data de Nascimento',
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        DateFormatter()
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira uma data';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),

                    // Botão de registro
                    CustomButton(
                      text: 'Registrar',
                      onPressed: isLoading ? null : () => signUp(),
                    ),
                    const SizedBox(height: 20),
                    // Link para a tela de login
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Já possui uma conta?'),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: const Text('faça o login!',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
