import 'package:flutter/material.dart';

class TextFiwidget extends StatelessWidget {
  final TextEditingController controller;
  final Icon icon;
  final String labaltext;
  const TextFiwidget({
    super.key,
    required this.controller,
    required this.icon,
    required this.labaltext,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: icon,
          labelText: labaltext,
          labelStyle: TextStyle(color: Colors.black38),
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }
}
