import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SquidGameHome extends StatefulWidget {
  const SquidGameHome({super.key});

  @override
  State<SquidGameHome> createState() => _SquidGameHomeState();
}

class _SquidGameHomeState extends State<SquidGameHome> {
  bool transition = false;

  startTimeout() {
    return Timer(const Duration(seconds: 8), handleTimeout);
  }

  void handleTimeout() {
    setState(() {
      transition = true;
    });
  }

  @override
  void initState() {
    startTimeout();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(
          seconds: 1,
        ),
        child: Stack(
          children: [
            Positioned(
              top: -200, // Move the image up by 100 pixels
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/sg.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 40,
              left: 10,
              right: 10,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Lottie.asset('assets/lottie/lf30_editor_c8c9sumf.json'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}