import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
// import 'package:location/location.dart' as location;
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:weathers/network/weather_api.dart';
import 'package:weathers/utils/colors.dart';

import '../models/weather_response_model.dart';
import '../utils/default_dialog.dart';
import '../views/login_screen.dart';
import 'login_controller.dart';

class HomepageController extends GetxController with StateMixin {
  WeatherResponseModel weatherResponseModel = WeatherResponseModel();
  // final RefreshController refreshController = RefreshController(
  //   initialRefresh: false,
  // );
  @override
  void onInit() async {
    super.onInit();

    await userLocationPosition();

    change(state, status: RxStatus.success());
  }

  LoginController loginController = Get.find();

  void signout() async {
    try {
      loginController.passwordController.clear();
      loginController.usernameController.clear();

      await FirebaseAuth.instance.signOut().then(
            (value) => Get.offAll(() => LoginScreen()),
          );
    } catch (e) {
      print(e);
    }
  }

  Future getcurrentLocatin() async {
    DefaultDialog.showLoading();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);

    // var lat = 11.258753;
    // var lon = 75.780411;
    var lat = position.latitude.toString();
    var lon = position.longitude.toString();
    print(lon);
    print(lat);
    WeatherResponseModel data = await ApiService().getWeatherDetails(lat, lon);
    weatherResponseModel = data;
    // loading = false;
    DefaultDialog.hideLoading();
    update();
  }

  Future<Position> userLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar(
        "'Location permissions are denied, we cannot request permissions.'",
        "",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.bluelt,
      );
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar(
          "'Location permissions are permanently denied, we cannot request permissions.'",
          "",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.bluelt,
        );
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    getcurrentLocatin();
    update();
    return await Geolocator.getCurrentPosition();
  }
}
