import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({super.key, required this.buttonText, this.onPressed});
  final String buttonText;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 5, 218, 233),
            Color.fromARGB(184, 255, 255, 255),
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(395, 55),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
        ),
        child: Text(
          buttonText,
          style: const TextStyle(
            color: Color.fromRGBO(15, 86, 151, 1),
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
