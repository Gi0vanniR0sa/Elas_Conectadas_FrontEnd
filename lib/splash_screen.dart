import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkLoginStatus();
    });
    checkLoginStatus();
  }

Future<void> checkLoginStatus() async {
  final prefs = await SharedPreferences.getInstance();
  //final token = prefs.getString('access_token');
  final token = await prefs.remove('acess_token');

  if (token != null) {
    Navigator.pushReplacementNamed(context, '/auth');
  } else {
    Navigator.pushReplacementNamed(context, '/home');
  }
}


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
