import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_test/home/v_home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../_services/c_data_controller.dart';

class LoginPageController extends GetxController {
  DataController dataController = Get.find();
  TextEditingController txtEmail = TextEditingController(text: "");
  TextEditingController txtPassword = TextEditingController(text: "");
  ValueNotifier<bool> xObscured = ValueNotifier(true);

  void checkAllField() async {
    if (txtEmail.text.isNotEmpty && txtPassword.text.isNotEmpty) {
      signInWithEmail(txtEmail.text, txtPassword.text);
    } else {
      maxDialog("Enter all field", false);
    }
  }

  Future<void> signInWithEmail(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      //to get the current user name
      Get.offAll(
        () => const HomePage(),
      );
    } catch (e) {
      if (e is FirebaseAuthException) {
        switch (e.code) {
          case 'invalid-credential':
            maxDialog("Invalid credentials. Try again.", false);
            break;
          default:
            maxDialog("Error: ${e.message}", false);
            break;
        }
      } else {
        print("Error: $e");
      }
    }
  }
}
