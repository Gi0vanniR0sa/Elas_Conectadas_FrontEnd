import 'package:flutter/material.dart';

class AppBottomTabs extends StatelessWidget {
  const AppBottomTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color(0xFF6441a5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(Icons.home, color: Colors.white),
            onPressed: () => Navigator.pushReplacementNamed(context, '/'),
          ),
          IconButton(
            icon: const Icon(Icons.book, color: Colors.white),
            onPressed: () => Navigator.pushReplacementNamed(context, '/posts'),
          ),
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white),
            onPressed: () =>
                Navigator.pushReplacementNamed(context, '/profile'),
          ),
        ],
      ),
    );
  }
}
