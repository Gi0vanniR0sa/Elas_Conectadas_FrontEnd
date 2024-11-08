import 'package:conectadas_app/pages/auth/login.dart';
import 'package:conectadas_app/service/auth_service.dart';
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
  State<RegisterPage> createState() => _RegisterState();
}

class _RegisterState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _dobController = TextEditingController();
  final AuthService authService = AuthService();

  void singup() async {
    String email = _emailController.text;
    String name = _nameController.text;
    String password = _passwordController.text;
    String phone = _phoneController.text;
    String dob = _dobController.text;
    bool signupSuccess = await authService.signUp(email, name, password, phone, dob);
    
    if (signupSuccess) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => LoginPage(onTap: () {}),),
      );
    } else {
      print("Failed");
    }
  }

  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        actions: const <Widget>[ThemeSwitch(),],
      ),
      
      body: SingleChildScrollView(
        child:SafeArea(
          child:Center(
            child:Padding( padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 80.0),
              child: Column( mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(image: AssetImage("assets/elas.png")),
                  const SizedBox(height: 20.0),

                  CustomTextField(controller: _emailController, label: 'Email', obscureText: false),
                  const SizedBox(height: 7.0),
                  CustomTextField(controller: _nameController, label: 'Nome', obscureText: false),
                  const SizedBox(height: 7.0),
                  CustomTextField(controller: _passwordController, label: 'Senha', isPassword: true, obscureText: true),
                  const SizedBox(height: 7.0),

                  CustomTextField(controller: _phoneController, label: 'Celular',  keyboardType: TextInputType.number,
                    inputFormatters: [ FilteringTextInputFormatter.digitsOnly,PhoneNumFormatter(),],
                  ),
                  const SizedBox(height: 7.0),

                  CustomTextField(controller: _dobController, label: 'Data de Nascimento', keyboardType: TextInputType.number,
                    inputFormatters: [ FilteringTextInputFormatter.digitsOnly, DateFormatter(),],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a date';
                      }
                      return null;
                  },),
                  const SizedBox(height: 20.0),

                  CustomButton( text: 'Registrar',
                    onPressed:(){
                      singup();
                    },
                  ),
                  const SizedBox(height: 20),

                  Row( mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Já possui uma conta?',),
                      const SizedBox(width: 4,),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text('faça o login!', style:TextStyle(fontWeight: FontWeight.bold),),
                      )
                    ],
                  ),
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  
  /// limpas os controllers
  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _dobController.dispose();
    super.dispose();
  }
}