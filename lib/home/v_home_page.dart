import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String state;
  final String message;
  const HomePage({super.key, required this.state, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              state,
              style: TextStyle(color: Colors.white),
            ),
            Text(
              message,
              style: TextStyle(color: Colors.greenAccent,fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
