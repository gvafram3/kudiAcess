import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Widget mainContent;

  const GradientBackground({required this.mainContent, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.center,
          colors: [
            Color.fromARGB(220, 108, 178, 179),
            Colors.transparent,
            Colors.transparent,
          ],
        ),
      ),
      child: SafeArea(
        child: Center(child: mainContent),
      ),
    );
  }
}
