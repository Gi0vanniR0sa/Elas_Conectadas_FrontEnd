import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final BuildContext context;
  final Widget destinationScreen;
  final bool isVisible;

  const CustomFloatingActionButton({
    Key? key,
    required this.context,
    required this.destinationScreen,
    required this.isVisible
  });

  @override
  Widget build(BuildContext context) {
    if (!isVisible) return const SizedBox.shrink();
    return FloatingActionButton(
      onPressed: () async {
        await Navigator.push(
          context, MaterialPageRoute(builder: (context) => destinationScreen),
        );
      },
      backgroundColor: Colors.purple,
      child: const Icon(Icons.add, color: Colors.white),
    );
  }
}