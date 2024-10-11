import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String state;
  const HomePage({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(state),
      ),
    );
  }
}