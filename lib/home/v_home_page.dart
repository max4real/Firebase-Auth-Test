import 'package:firebase_auth_test/home/c_home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final String state;
  final String message;
  const HomePage({super.key, required this.state, required this.message});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
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
              style: TextStyle(color: Colors.greenAccent, fontSize: 16),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                controller.signOut();
              },
              child: const Text("LOGOUT"),
            )
          ],
        ),
      ),
    );
  }
}
