import 'package:flutter/material.dart';
import 'package:my_application/screens/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan[50],
        foregroundColor: Colors.black87,
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
          );
        },
        child: const Icon(Icons.arrow_forward_ios_sharp),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'MaestroKeep',
                style: TextStyle(
                  fontSize: 34.0,
                  fontFamily: 'RobotoMono',
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                  color: Colors.cyan[50],
                ),
              ),
              Text(
                'version 0.1.1 beta',
                style: TextStyle(
                    fontFamily: 'RobotoMono',
                    color: Colors.cyan[50],
                    fontSize: 15.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
