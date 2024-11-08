import 'package:conectadas_app/pages/home_page.dart';
import 'package:conectadas_app/pages/posts/adm/create_posts.dart';
import 'package:conectadas_app/pages/posts/adm/posts_list_page.dart';
import 'package:conectadas_app/pages/posts/user/create_ads.dart';
import 'package:conectadas_app/pages/profile/user_profile.dart';
import 'package:conectadas_app/service/login_or_register.dart';
import 'package:conectadas_app/splash_screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getRoutes() {
  return {
    '/': (context) => SplashScreen(),
    
    '/auth': (context) => const LoginOrRegister(),
    '/profile': (context) => const UserPage(),
    
    '/home': (context) => const HomePage(),
    '/posts': (context) => const PostsListPage(),

    '/createads': (context) =>  const AdCreationPage(),
    '/createpost': (context) => const PostCreationPage(),
  };
}