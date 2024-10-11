import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_test/home/v_home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../_services/c_data_controller.dart';

class SignUpController extends GetxController {
  DataController dataController = Get.find();
  TextEditingController txtName = TextEditingController(text: "");
  TextEditingController txtEmail = TextEditingController(text: "");
  TextEditingController txtPassword = TextEditingController(text: "");
  ValueNotifier<bool> xObscured = ValueNotifier(true);

  void checkAllField() async {
    if (txtEmail.text.isNotEmpty &&
        txtPassword.text.isNotEmpty &&
        txtName.text.isNotEmpty) {
      signUpWithEmailandPassword(txtEmail.text, txtPassword.text, txtName.text);
    } else {
      maxDialog("Enter all field", false);
    }
  }

  Future<void> signUpWithEmailandPassword(
      String email, String password, String name) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      User? user = userCredential.user;
      if (user != null) {
        await user.updateDisplayName(txtName.text);
        await user.reload();
        user = FirebaseAuth.instance.currentUser;
      }
      Get.offAll(
        () => HomePage(
          state: dataController.loginState.value.toString(),
          message: 'Successfully Created - ${user!.displayName}',
        ),
      );
    } catch (e) {
      if (e is FirebaseAuthException) {
        switch (e.code) {
          case 'email-already-in-use':
            maxDialog("The email address is already in use.", false);
            break;
          case 'weak-password':
            maxDialog("The password provided is too weak.", false);
            break;
          case 'invalid-email':
            maxDialog("The email address is badly formatted.", false);
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
