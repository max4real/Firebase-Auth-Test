import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DataController extends GetxController {
  
}
void dismissKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}