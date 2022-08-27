import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weathers/utils/colors.dart';
import 'package:weathers/views/sign_up_screen.dart';

import '../controllers/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx((state) => SafeArea(
          child: Scaffold(
            backgroundColor: Color.fromARGB(255, 249, 249, 249),
            body: SingleChildScrollView(
              child: GetBuilder<LoginController>(builder: (_) {
                return Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100.h,
                      ),
                      Center(
                        child: SizedBox(
                          height: 50.h,
                          child: Image.asset('assets/images/weather.jpg'),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 5.w, right: 5.w, top: 40.h),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 21.sp,
                                    color: AppColors.pRIMARYCOLOR,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 15, top: 5),
                              child: TextFormField(
                                onChanged: (text) =>
                                    controller.validateText(text),
                                controller: controller.usernameController,
                                decoration: const InputDecoration(
                                  errorBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.black)),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                      borderSide: BorderSide(
                                          width: 1, color: AppColors.bluedark)),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)),
                                    borderSide: BorderSide(
                                        width: 1, color: AppColors.bluedark),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 1.0),
                                  ),
                                  labelText: 'E-mail',
                                  labelStyle:
                                      TextStyle(color: AppColors.pRIMARYCOLOR),
                                ),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (!GetUtils.isEmail(value!))
                                    return "E-mail is not valid";
                                  else
                                    return null;
                                },
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 20, right: 15, top: 5),
                              child: TextFormField(
                                onChanged: (value) =>
                                    controller.validateText(value),
                                controller: controller.passwordController,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  errorBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.black)),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                      borderSide: BorderSide(
                                          width: 1, color: AppColors.bluedark)),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)),
                                    borderSide: BorderSide(
                                        width: 1, color: AppColors.bluedark),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 1.0),
                                  ),
                                  labelText: 'Password',
                                  labelStyle:
                                      TextStyle(color: AppColors.pRIMARYCOLOR),
                                ),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  // add your custom validation here.
                                  if (value!.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  if (value.length < 6) {
                                    return 'Must be more than 6 charater';
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 100.h,
                      ),
                      Container(
                        width: 170.w,
                        child: ElevatedButton(
                          onPressed: () {
                            controller.login();
                          },
                          child: Text("Login"),
                          style: ElevatedButton.styleFrom(
                              primary: AppColors.pRIMARYCOLOR),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text('Does not have account?'),
                          TextButton(
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  color: AppColors.pRIMARYCOLOR),
                            ),
                            onPressed: () {
                              Get.offAll(() => SignUpScreen());
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ));
  }
}
