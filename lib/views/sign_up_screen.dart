import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weathers/views/login_screen.dart';

import '../controllers/login_controller.dart';
import '../utils/colors.dart';

class SignUpScreen extends GetView<LoginController> {
  SignUpScreen({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => Scaffold(
        body: GetBuilder<LoginController>(builder: (_) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 40.h),
                  child: Column(
                    
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 21.sp,
                              color: AppColors.pRIMARYCOLOR,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 15, top: 5),
                        child: TextFormField(
                          controller: controller.signinFNController,
                          decoration: const InputDecoration(
                            errorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                borderSide:
                                    BorderSide(width: 1, color: Colors.black)),
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
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                            ),
                            labelText: 'First Name',
                            labelStyle:
                                TextStyle(color: AppColors.pRIMARYCOLOR),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 15, top: 5),
                        child: TextFormField(
                          controller: controller.signinLNController,
                          decoration: const InputDecoration(
                            errorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                borderSide:
                                    BorderSide(width: 1, color: Colors.black)),
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
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                            ),
                            labelText: 'Last Name',
                            labelStyle:
                                TextStyle(color: AppColors.pRIMARYCOLOR),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 15, top: 5),
                        child: TextFormField(
                          controller: controller.signinusernameController,
                          decoration: const InputDecoration(
                            errorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                borderSide:
                                    BorderSide(width: 1, color: Colors.black)),
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
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                            ),
                            labelText: 'E-mail',
                            labelStyle:
                                TextStyle(color: AppColors.pRIMARYCOLOR),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                        padding: EdgeInsets.only(left: 20, right: 15, top: 5),
                        child: TextFormField(
                          controller: controller.signinpasswordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            errorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                borderSide:
                                    BorderSide(width: 1, color: Colors.black)),
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
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                            ),
                            labelText: 'Password',
                            labelStyle:
                                TextStyle(color: AppColors.pRIMARYCOLOR),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                      controller.createUser();
                    },
                    child: Text("Sign Up"),
                    style: ElevatedButton.styleFrom(
                        primary: AppColors.pRIMARYCOLOR),
                  ),
                ),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?'),
                    TextButton(
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 18.sp, color: AppColors.pRIMARYCOLOR),
                      ),
                      onPressed: () {
                        Get.offAll(() => LoginScreen());
                      },
                    )
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}


