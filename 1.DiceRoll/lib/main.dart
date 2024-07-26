import 'package:flutter/material.dart';
import 'gradientContainer.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          Color.fromARGB(255, 78, 5, 109),
          Color.fromARGB(255, 68, 21, 109),
        ),
      ),
    ),
  );
}
