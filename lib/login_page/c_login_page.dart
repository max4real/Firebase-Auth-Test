import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../_services/c_data_controller.dart';

class LoginPageController extends GetxController {
  DataController dataController = Get.find();
  TextEditingController phoneNumber = TextEditingController(text: "");
  TextEditingController password = TextEditingController(text: "");
  ValueNotifier<bool> xObscured = ValueNotifier(true);
}
