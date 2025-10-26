import 'package:conectadas_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:vector_graphics/vector_graphics.dart';

class NewSplashScreen extends StatelessWidget {
  final Widget nextScreen;

  const NewSplashScreen({
    super.key,
    required this.nextScreen,
  });

  @override
  Widget build(BuildContext context) {
    const logo = AssetBytesLoader(
      'assets/images/Elas_Conectadas_White_Letters-cropped.vec',
    );

    return AnimatedSplashScreen(
      splash: Stack(
        children: [
          Center(
            child: Lottie.asset(
                'assets/animations/Shopping Cart Animation File.json',
                width: 800,
                height: 800,
                repeat: true
            ),
          ),
          const Align(
              alignment: Alignment.bottomCenter,
              child: VectorGraphic(
                loader: logo,
                width: 80,
                height: 80,
              )),
        ],
      ),
      nextScreen: nextScreen,
      backgroundColor: Color(0xFF9146FF),
      splashIconSize: 800,
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
      animationDuration: const Duration(seconds: 1),
    );
  }
}
