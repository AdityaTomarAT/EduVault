import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jecrc/features/src/auth/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Navigate to the next screen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Get.to(() => const Onboarding(), transition: Transition.fadeIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        // Adding a vignette effect using a RadialGradient
        gradient: RadialGradient(
          center: Alignment.center, // Focus on the center
          radius: 1.25, // Radius of the gradient
          colors: [
            Colors.black, // Dark edges
            Color.fromARGB(255, 231, 63, 80), // Center remains transparent
          ],
          stops: [0.78, 1.2], // Control the spread of the gradient
        ),
      ),
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                "assets/images/logo4.png",
                scale: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
