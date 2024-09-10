// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:foodle/button.dart';
import 'package:foodle/loading.dart';
import 'package:foodle/service.dart';
import 'package:foodle/solution.dart';
import 'package:parallax_rain/parallax_rain.dart';

class Foodel extends StatefulWidget {
  const Foodel({super.key});

  @override
  State<Foodel> createState() => _FoodelState();
}

class _FoodelState extends State<Foodel> {
  final TextEditingController _controller = TextEditingController();
  final bool _isLoading = false;
  String? _solution;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
                    'Foodle',
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
                          child: const Text(
                            'Stuck on something? Foodle is here to solve your problems and make things easier.',
                            style: TextStyle(
                              fontFamily: 'NerkoOne',
                              color: Colors.black,
                              fontSize: 25,
                              
                              ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 0),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15.0, 80.0, 15.0, 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 205, 226, 226),
                              border: Border.all(),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(12.0, 0.0, 0.0, 0.0),
                              child: TextField(
                                controller: _controller,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'Enter your question here!',
                                ),
                                maxLines: 6,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 90),
                        GradientButton(
                          buttonText: 'Search',
                          onPressed: _getsolution,
                        ),
                        if (_isLoading) const CircularProgressIndicator(),
                        if (_solution != null)
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              _solution ?? 'No solution found',
                              style: const TextStyle(
                                fontFamily: 'OpenSans',
                                fontSize: 18,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
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

  void _getsolution() async {

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const Loading(),
    ),
  );

  final solutionService = SolutionService('AIzaSyCqpn4PVTI5ehAOIA4OWJjJm-SK2A4wfQk');
  final text = _controller.text;

  try {
    final solution = await solutionService.generatesolution(text);

    
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SolutionScreen(solution: solution ?? 'No solution found'),
      ),
    );
  } catch (e) {

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SolutionScreen(solution: 'Error: $e'),
      ),
    );
  }
}
}