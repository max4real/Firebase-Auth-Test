import 'package:firebase_auth_test/login_page/c_login_page.dart';
import 'package:firebase_auth_test/sign_up/v_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../_services/c_data_controller.dart';
import '../_services/c_theme_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginPageController controller = Get.put(LoginPageController());
    DataController dataController = Get.find();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              "assets/images/KanaOoLogo.png",
              fit: BoxFit.fill,
            ),
            SingleChildScrollView(
              child: SizedBox(
                height: Get.height - 20,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 300,
                        decoration: BoxDecoration(
                            color: secondary,
                            borderRadius: BorderRadius.circular(40)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 10,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "LOGIN",
                                style:
                                    TextStyle(fontSize: 20, color: background),
                              ),
                              Text(
                                dataController.loginState.value.toString(),
                                style:
                                    TextStyle(fontSize: 10, color: background),
                              ),
                              TextField(
                                controller: controller.txtEmail,
                                keyboardType: TextInputType.emailAddress,
                                maxLines: 1,
                                onTapOutside: (event) {
                                  dismissKeyboard();
                                },
                                cursorWidth: 1,
                                cursorColor: secondary,
                                cursorHeight: 15,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: onBackground,
                                    prefixIcon: const Icon(Icons.email,
                                        size: 20, color: Colors.white),
                                    hintText: "Email"),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ValueListenableBuilder(
                                valueListenable: controller.xObscured,
                                builder: (context, value, child) {
                                  return TextField(
                                    controller: controller.txtPassword,
                                    obscureText: value,
                                    maxLines: 1,
                                    onTapOutside: (event) {
                                      dismissKeyboard();
                                    },
                                    cursorWidth: 1,
                                    cursorColor: secondary,
                                    cursorHeight: 15,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor: onBackground,
                                      prefixIcon: const Icon(
                                        Iconsax.password_check,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      hintText: "Password",
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          controller.xObscured.value =
                                              !controller.xObscured.value;
                                        },
                                        icon: value
                                            ? const Icon(Iconsax.eye_slash)
                                            : Icon(
                                                Iconsax.eye,
                                                color: secondary,
                                              ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {
                                  controller.checkAllField();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: background,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50, vertical: 10),
                                ),
                                child: const Text(
                                  "LOGIN",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.to(() => const SignUpPage());
                                },
                                child: const Text(
                                  "SIGN UP",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
