import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  const TextBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(top: 20, bottom: 30),
      child: const TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: 'Text Box',
          labelStyle: TextStyle(color: Colors.blue),
          hintText: 'Enter Text Here',
        ),
      ),
    );
  }
}
