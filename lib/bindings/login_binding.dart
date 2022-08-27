import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weathers/views/home_screen.dart';
import 'package:weathers/views/login_screen.dart';

import '../controllers/login_controller.dart';

// class LoginBinding implements Bindings {
//   @override
//   void dependencies() {
//     Get.put(LoginController());
//   }
// }
class InstanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}

class IsSignedIn extends GetWidget<LoginController> {
  const IsSignedIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Get.find<LoginController>().user != null
          ? HomePage()
          : LoginScreen();
    });
  }
}
