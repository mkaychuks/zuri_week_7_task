import 'package:flutter/material.dart';
import 'package:my_application/screens/login_screen.dart';

import '../constants/widgets/elevated_button_widget.dart';
import '../constants/widgets/textfield_widget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController forgotPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: const Text(
          'Forgot Password',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Enter your email, a reset code will be sent to you',
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFieldWidget(
                hintText: 'Enter your email, a reset code will be sent',
                textFieldIcon: Icons.email,
                controller: forgotPasswordController,
              ),
              const SizedBox(
                height: 30.0,
              ),
              ElevatedButtonWidget(
                buttonColor: Colors.green,
                buttonText: 'SUbmit',
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
