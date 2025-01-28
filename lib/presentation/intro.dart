import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:squid/presentation/home/home.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
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
              top: -200,
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
            Positioned(
                bottom: 10,
                right: 10,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(CupertinoPageRoute(builder: (context) =>  HomeScreen()));
                  },
                  child: Row(
                    children: [
                      const Text(
                        "START",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.arrow_right_alt_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(height: 66, child: Lottie.asset('assets/lottie/animation_employee.json')),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
