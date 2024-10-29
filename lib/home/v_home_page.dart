import 'package:firebase_auth_test/_services/c_data_controller.dart';
import 'package:firebase_auth_test/home/c_home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    DataController dataController = Get.find();
    HomeController controller = Get.put(HomeController());
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              dataController.loginState.value.toString(),
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "this is home",
              style: TextStyle(color: Colors.greenAccent, fontSize: 16),
            ),
            ValueListenableBuilder(
              valueListenable: controller.name,
              builder: (context, value, child) {
                return Text(
                  value,
                  style: TextStyle(color: Colors.greenAccent, fontSize: 16),
                );
              },
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                controller.getAccName();
              },
              child: const Text("get name"),
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
