import 'package:flutter/material.dart';

class TestSports extends StatelessWidget {
  const TestSports({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Sports',
        style: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
