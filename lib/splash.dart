// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:foodle/homescreen.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 5));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const Foodel(),
      ),
    );
  }

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
            'assets/animation/splash.json',
            height: 400,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
