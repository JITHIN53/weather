import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:weathers/utils/colors.dart';
import 'package:weathers/views/home_screen.dart';
import 'package:weathers/views/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:weathers/views/home_screen.dart';
import 'package:weathers/views/login_screen.dart';

import '../utils/default_dialog.dart';

class LoginController extends GetxController with StateMixin {
  @override
  void onInit() async {
    super.onInit();
    LocOn();
    validate = true;
    firebaseUser.bindStream(auth.authStateChanges());
    change(state, status: RxStatus.success());
  }

  FirebaseAuth auth = FirebaseAuth.instance;

  Rxn<User> firebaseUser = Rxn<User>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool loadingData = false.obs;

  get user => firebaseUser.value?.email;

  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController signinpasswordController = TextEditingController();
  TextEditingController signinusernameController = TextEditingController();
  TextEditingController signinFNController = TextEditingController();
  TextEditingController signinLNController = TextEditingController();

  bool? validate;
  validateText(String input) {
    validate = true;
    update();
  }

  Location loc = Location();
  Future LocOn() async {
    try {
      bool ison = await loc.serviceEnabled();
      if (!ison) {
        //if defvice is off
        bool isturnedon = await loc.requestService();
        if (isturnedon) {
          print("GPS device is turned ON");
        } else {
          print("GPS Device is still OFF");
        }
      }
    } catch (e) {}
  }

  Future signUP() async {
    try {
      // loadingData.value = true;
      DefaultDialog.showLoading();
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: signinusernameController.text.trim(),
        password: signinpasswordController.text.trim(),
      );
      Get.offAll(() => HomePage());
      // loadingData.value = false;
      DefaultDialog.hideLoading();
      update();
    } on FirebaseAuthException catch (e) {
      // loadingData.value = false;
      DefaultDialog.hideLoading();
      update();
      print(e);
    }
    update();
  }

  void createUser() async {
    try {
      // loadingData.value = true;
      DefaultDialog.showLoading();
      CollectionReference reference =
          FirebaseFirestore.instance.collection("Users");

      Map<String, String> userdata = {
        "First Name": signinFNController.text.trim(),
        "Last Name": signinLNController.text.trim(),
        "Email": signinusernameController.text.trim()
      };

      print(signinpasswordController.text);
      await auth
          .createUserWithEmailAndPassword(
              email: signinusernameController.text.trim(),
              password: signinpasswordController.text.trim())
          .then((value) {
        reference.add(userdata).then(
          (value) {
            return Get.offAll(
              () {
                DefaultDialog.hideLoading();
                return LoginScreen();
              },
            );
          },
        );

        update();
      }).catchError(
        (onError) {
          DefaultDialog.hideLoading();

          return Get.snackbar("Error while creating account ", onError.message,
              backgroundColor: AppColors.bluelgtr);
        },
      );
    } catch (e) {
      DefaultDialog.hideLoading();
      print(e);
    }
  }

  void login() async {
    try {
      if (formKey.currentState!.validate()) DefaultDialog.showLoading();
      await auth
          .signInWithEmailAndPassword(
              email: usernameController.text, password: passwordController.text)
          .then(
            (value) => Get.offAll(
              () => HomePage(),
            ),
          )
          .catchError(
        (onError) {
          DefaultDialog.hideLoading();
          return Get.snackbar("Error while sign in ", onError.message,
              backgroundColor: AppColors.bluelgtr);
        },
      );
      DefaultDialog.hideLoading();
    } catch (e) {
      DefaultDialog.hideLoading();
      print(e);
    }
  }
}
