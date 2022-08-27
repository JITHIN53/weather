import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weathers/views/login_screen.dart';

import '../controllers/login_controller.dart';
import '../utils/colors.dart';

class SignUpScreen extends GetView<LoginController> {
  SignUpScreen({Key? key}) : super(key: key);
  // controller controller = Get.put(controller());

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
                    // mainAxisAlignment: MainAxisAlignment.start,
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



// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// // import 'package:location/location.dart' as location;
// import 'package:pull_to_refresh/pull_to_refresh.dart';
// import 'package:weathers/controllers/login_controller.dart';
// import 'package:weathers/network/weather_api.dart';
// import 'package:weathers/utils/colors.dart';
// import 'package:weathers/utils/default_dialog.dart';

// import '../models/weather_response_model.dart';
// import '../views/login_screen.dart';

// class HomepageController extends GetxController with StateMixin {
//   WeatherResponseModel weatherResponseModel = WeatherResponseModel();

//   final RefreshController refreshController = RefreshController(
//     initialRefresh: false,
//   );
  // LoginController loginController = Get.find();
//   // RxBool loading = false.obs;
//   @override
//   void onInit() async {
//     super.onInit();

//     await userLocationPosition();

//     change(state, status: RxStatus.success());
//   }

//   Future onRefresh() async {
 
//     try {
//         //  DefaultDialog.showLoading();
//       await userLocationPosition();
//       refreshController.refreshCompleted();

//     } catch (e) {
//       print(e);
//       DefaultDialog.hideLoading();
//       // refreshController.refreshFailed();
//     }
//    DefaultDialog.hideLoading();

//     update();
//   }

  // Future getcurrentLocatin() async {
  //   // loading.value = true;
  //   DefaultDialog.showLoading();
  //   Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.low);

  //   // var lat = 11.258753;
  //   // var lon = 75.780411;
  //   var lat = position.latitude.toString();
  //   var lon = position.longitude.toString();
  //   print(lon);
  //   print(lat);
  //   WeatherResponseModel data = await ApiService().getWeatherDetails(lat, lon);
  //   weatherResponseModel = data;
  //   // loading.value = false;
  //   DefaultDialog.hideLoading();

  //   update();
  // }

  // Future<Position> userLocationPosition() async {
  //   try {
  //     bool serviceEnabled;
  //     LocationPermission permission;
  //     // loading.value = true;
  //     // DefaultDialog.showLoading();
  //     serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //     if (!serviceEnabled) {
  //       Get.snackbar(
  //         "'Location services are disabled'",
  //         "",
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: AppColors.bluelt,
  //       );
  //       return Future.error('Location services are disabled.');
  //     }

  //     permission = await Geolocator.checkPermission();
  //     if (permission == LocationPermission.denied) {
  //       permission = await Geolocator.requestPermission();
  //       if (permission == LocationPermission.denied) {
  //         Get.snackbar(
  //           "'Location permissions are denied'",
  //           "",
  //           snackPosition: SnackPosition.BOTTOM,
  //           backgroundColor: AppColors.bluelgtr,
  //         );
  //         return Future.error('Location permissions are denied');
  //       }
  //     }

  //     if (permission == LocationPermission.deniedForever) {
  //       Get.snackbar(
  //         "'Location permissions are permanently denied, we cannot request permissions.'",
  //         "",
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: AppColors.bluelgtr,
  //       );
  //       return Future.error(
  //           'Location permissions are permanently denied, we cannot request permissions.');
  //     }
  //     getcurrentLocatin();
  //     DefaultDialog.hideLoading();
  //     // loading.value = false;
  //     update();
  //     return await Geolocator.getCurrentPosition();
  //   } catch (e) {
  //     DefaultDialog.hideLoading();
  //     print(e);
  //   }
  //   return await Geolocator.getCurrentPosition();
  // }


  // LoginController loginController = Get.find();
  // void signout() async {
  //   try {
  //     DefaultDialog.showLoading();
  //     loginController.passwordController.clear();
  //     loginController.usernameController.clear();

  //     await FirebaseAuth.instance.signOut().then(
  //           (value) => Get.offAll(() => LoginScreen()),
  //         );
  //     DefaultDialog.hideLoading();
  //   } catch (e) {
  //     print(e);
  //     DefaultDialog.hideLoading();
  //   }
  // }
// }
