// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_application/screens/home.dart';
import 'package:my_application/screens/register_screen.dart';

import '../constants/widgets/elevated_button_widget.dart';
import '../constants/widgets/textfield_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: const Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFieldWidget(
                hintText: 'email',
                textFieldIcon: Icons.email,
                controller: emailController,
              ),
              const SizedBox(
                height: 12.0,
              ),
              const SizedBox(
                height: 12.0,
              ),
              TextFieldWidget(
                hintText: 'password',
                textFieldIcon: Icons.key,
                controller: passwordController,
              ),
              const SizedBox(
                height: 18.0,
              ),
              ElevatedButtonWidget(
                buttonColor: Colors.blueAccent,
                buttonText: 'Login',
                onPressed: () async {
                  try{
                    await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
                  }  on FirebaseAuthException catch (e){
                    if(e.code == 'wrong-password'){
                      print('Wrong password provided for that user');
                    }
                  }
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 12.0,
              ),
              Center(
                child: Text(
                  'or'.toUpperCase(),
                  style: const TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              ElevatedButtonWidget(
                buttonColor: Colors.green,
                buttonText: 'Register',
                onPressed: ()  {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterScreen(),
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
