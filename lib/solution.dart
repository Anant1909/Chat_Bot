import 'package:flutter/material.dart';
import 'package:parallax_rain/parallax_rain.dart';

class SolutionScreen extends StatelessWidget {
  final String solution;

  const SolutionScreen({super.key, required this.solution});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[ 
          ParallaxRain(
            dropColors: const[
              Color.fromARGB(255, 255, 17, 0),
              Color.fromARGB(255, 0, 255, 8),
              Color.fromARGB(255, 229, 243, 255),
              Color.fromARGB(255, 255, 230, 0),
              Color.fromARGB(255, 255, 68, 0),
              Color.fromARGB(255, 212, 0, 255),
            ],
            child: Container(),
          ),
        Container(
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
          child: Column(
            children: <Widget>[
              AppBar(
                centerTitle: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: const Text(
                  'Solution',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFE4B5),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(16.0),
                        padding: const EdgeInsets.all(16.0),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 205, 226, 226),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.zero,
                            bottomRight: Radius.circular(40),
                            topLeft: Radius.circular(40),
                            topRight: Radius.zero,
                          ),
                        ),
                        child: Text(solution,
                        style: const TextStyle(
                          fontFamily: 'Rubik',
                          color:Color.fromARGB(255, 16, 0, 109),
                          fontSize: 20
                        ),),
                        
                      ),
                      
                      
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
      ),
    );
  }
}
