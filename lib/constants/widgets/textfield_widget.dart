import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  String hintText;
  IconData textFieldIcon;
  TextEditingController? controller;

  TextFieldWidget({super.key, required this.hintText, required this.textFieldIcon, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // style: TextStyle(color: Colors.white),
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(
          textFieldIcon,
          color: Colors.cyan[50],
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromARGB(255, 178, 213, 218)),
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromARGB(255, 178, 213, 218)),
          borderRadius: BorderRadius.circular(12.0),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(color: Color.fromARGB(255, 178, 213, 218)),
        // prefixIconColor: Colors.amber
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}
