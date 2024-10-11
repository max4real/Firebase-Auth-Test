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
      // signIn();
      signInWithEmail(txtEmail.text, txtPassword.text);
    } else {
      maxDialog("Enter all field", false);
    }
  }

  Future<void> signInWithEmail(String email, String password) async {
    try {
      // Attempt to sign in
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      //if all goes well, go to home page.
      Get.offAll(
          () => HomePage(state: dataController.loginState.value.toString(),message: "Successfully Login",));
    } catch (e) {
      if (e is FirebaseAuthException) {
        // print("e code --------------------" + e.code);
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

  // void signIn() async {
  //   if (txtEmail.text.isNotEmpty && txtPassword.text.isNotEmpty) {
  //     try {
  //       await FirebaseAuth.instance.signInWithEmailAndPassword(
  //           email: txtEmail.text, password: txtPassword.text);
  //       Get.to(
  //           () => HomePage(state: dataController.loginState.value.toString()));
  //     } on FirebaseAuthException catch (e) {
  //       print(e);
  //     }
  //   }
  // }

  // Future<bool> checkIfEmailExists(String email) async {
  //   try {
  //     // Fetch sign-in methods for the given email
  //     final signInMethods =
  //         await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);

  //     // Check if there are any sign-in methods associated with the email
  //     return signInMethods.isNotEmpty;
  //   } catch (e) {
  //     print("Error: $e");
  //     return false; // Handle error accordingly
  //   }
  // }

  // Future<void> signInWithEmail(String email, String password) async {
  //   try {
  //     // Attempt to sign in
  //     await FirebaseAuth.instance
  //         .signInWithEmailAndPassword(email: email, password: password);

  //     print("Successfully signed in.");
  //   } catch (e) {
  //     if (e is FirebaseAuthException) {
  //       switch (e.code) {
  //         case 'user-not-found':
  //           print("No account found for that email.");
  //           // Here you might prompt the user to create a new account
  //           break;
  //         case 'wrong-password':
  //           print("Invalid credentials. Try again.");
  //           break;
  //         default:
  //           print("Error: ${e.message}");
  //           break;
  //       }
  //     } else {
  //       print("Error: $e");
  //     }
  //   }
  // }
}
