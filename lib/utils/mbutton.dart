import 'package:flutter/material.dart';

class Mbutton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const Mbutton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: onPressed, color: Colors.green[300], child: Text(text));
  }
}
