// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_application/constants/widgets/elevated_button_widget.dart';
import 'package:my_application/constants/widgets/textfield_widget.dart';
import 'package:my_application/screens/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

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
          'Register',
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
              TextFieldWidget(
                hintText: 'password',
                textFieldIcon: Icons.key,
                controller: passwordController,
              ),
              const SizedBox(
                height: 30.0,
              ),
              ElevatedButtonWidget(
                buttonColor: Colors.green,
                buttonText: 'Register',
                onPressed: () async {
                  try{
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
                  }  on FirebaseAuthException catch (e){
                    if(e.code == 'email-already-in-use'){
                      print('The account already exists');
                    }
                  }
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen(),),);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
