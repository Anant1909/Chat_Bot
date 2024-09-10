import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Color.fromARGB(255, 4, 162, 173),
              Color.fromARGB(184, 5, 27, 95),
            ],
          ),
        ),
        child: Center(
          child: Lottie.asset(
            'assets/animation/loading.json',
            height: 400,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
