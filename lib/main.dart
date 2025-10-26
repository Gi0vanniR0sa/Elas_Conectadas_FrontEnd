import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:conectadas_app/new_splash_screen.dart';
import 'package:conectadas_app/pages/auth/login.dart';
import 'package:conectadas_app/pages/auth/verifyotp.dart';
import 'package:conectadas_app/pages/home_page.dart';
import 'package:conectadas_app/service/shared_service.dart';
import 'package:conectadas_app/splash_screen.dart';
import 'package:conectadas_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool _result = await SharedService.isLoggedIn();
  print('🔍 Token JWT é valido? $_result');

   Widget nextScreen;

    if (_result) {
      // Obtemos os detalhes do login armazenados
      final loginDetails = await SharedService.loginDetails();

      // Verifica o status da conta
      final accountStatus = loginDetails?.user?.accountStatus ?? '';
      final email = loginDetails?.user?.email ?? '';

      print('📋 Status da conta: $accountStatus');

      if (accountStatus == 'UNVERIFIED') {
        // Se estiver logado mas não verificado, vai para a tela de verificação OTP
        nextScreen = VerifyOtp(email: email);
      } else {
        // Se estiver logado e verificado, vai para a home
        nextScreen = const HomePage();
      }
    } else {
      // Se não estiver logado, vai para a tela de login
      nextScreen = LoginPage(onTap: () {});
    }

    runApp(MyApp(defaultHome: NewSplashScreen(nextScreen: nextScreen)));
  }

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;
  final Widget defaultHome;

  const MyApp({super.key, this.savedThemeMode, required this.defaultHome});

  @override
  Widget build(BuildContext context) {
    //Set o tema do app
    return AdaptiveTheme(
      light: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      dark: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      //

      builder: (theme, darkTheme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        darkTheme: darkTheme,
        home: defaultHome,
        routes: getRoutes(),
      ),
    );
  }
}
