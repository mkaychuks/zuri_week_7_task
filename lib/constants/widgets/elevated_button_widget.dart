import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  String buttonText;
  Color buttonColor;
  void Function()? onPressed;

  ElevatedButtonWidget(
      {super.key, required this.buttonColor, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        fixedSize: const Size(400, 60),
        backgroundColor: buttonColor,
        foregroundColor: Colors.cyan[50],
        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      child: Text(buttonText.toUpperCase()),
    );
  }
}
