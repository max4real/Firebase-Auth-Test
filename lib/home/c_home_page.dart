import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_test/login_page/v_login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginPage());
    } catch (e) {
      print("Error signing out: $e");
    }
  }
  ValueNotifier<String> name = ValueNotifier('');

  void getAccName() {
    User? user = FirebaseAuth.instance.currentUser;

    name.value = user!.email!;
  }
}
