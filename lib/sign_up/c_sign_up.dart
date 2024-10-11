import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../_services/c_data_controller.dart';

class SignUpController extends GetxController {
  DataController dataController = Get.find();
  TextEditingController txtName = TextEditingController(text: "");
  TextEditingController txtEmail = TextEditingController(text: "");
  TextEditingController txtPassword = TextEditingController(text: "");
  ValueNotifier<bool> xObscured = ValueNotifier(true);
}
