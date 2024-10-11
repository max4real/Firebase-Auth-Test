import 'package:firebase_auth_test/login_page/v_login_page.dart';
import 'package:flutter/material.dart';

import '_services/c_data_controller.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(seconds: 1));
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3: true),
    home: const LoginPage(),
  ));
  Get.put(DataController());
}
