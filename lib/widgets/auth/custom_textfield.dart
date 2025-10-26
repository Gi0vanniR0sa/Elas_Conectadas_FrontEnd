import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool isPassword;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final int? maxLength;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  //final bool isEmail;

  const CustomTextField({
    super.key,
    required this.label,
    this.isPassword = false,
    this.obscureText = false,
    this.controller,
    this.keyboardType,
    this.validator,
    this.maxLength,
    this.suffixIcon,
    this.inputFormatters,
    //this.isEmail = false,
  });

  // Função para validar e-mail usando regex
  String? _emailValidator(String? value) {
    const String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    final RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    } else if (!regex.hasMatch(value)) {
      return 'Por favor, insira um e-mail válido';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isPassword ? obscureText : false,
      maxLength: maxLength,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        suffixIcon: suffixIcon,
      ),
      validator: validator,
     // validator: isEmail ? _emailValidator : validator,
    );
  }
}