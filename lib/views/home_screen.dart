import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:weathers/utils/colors.dart';
import 'package:weathers/utils/default_dialog.dart';
import 'package:weathers/views/login_screen.dart';

import '../controllers/homepage_controller.dart';
import '../controllers/login_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  HomepageController homepageController = Get.put(HomepageController());

  @override
  Widget build(BuildContext context) {
    final RefreshController homeRefreshController = RefreshController();

    void onRefresh() async {
      try {
        homepageController.userLocationPosition();
        homeRefreshController.refreshCompleted();
      } catch (e) {
        homeRefreshController.refreshFailed();
      }
    }

    return SafeArea(
      child: GetBuilder<HomepageController>(builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text("   Current Weather"),
            backgroundColor: AppColors.pRIMARYCOLOR,
            actions: [
              IconButton(
                onPressed: () async {
                  homepageController.signout();
                },
                icon: Icon(Icons.logout_sharp),
              ),
            ],
          ),
          body: SmartRefresher(
            enablePullDown: true,
            enablePullUp: false,
            onRefresh: () => onRefresh(),
            controller: homeRefreshController,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.pRIMARYCOLOR,
                    Colors.blue,
                    AppColors.pRIMARYCOLOR,
                  ],
                ),
              ),
              child: SafeArea(
                child: GetBuilder<HomepageController>(
                  builder: (_) {
                    if (homepageController.weatherResponseModel != null &&
                        homepageController.weatherResponseModel.main != null) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 100.h,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              var weatherdata = homepageController
                                  .weatherResponseModel.weather![index].main;
                              var tempCelsius = homepageController
                                      .weatherResponseModel.main!.temp! -
                                  273.15.round();
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "${tempCelsius.toStringAsFixed(0)} \u2103",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 60.0),
                                  ),
                                  SizedBox(height: 5.h),
                                  Text(
                                    "${homepageController.weatherResponseModel.name}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 40.0),
                                  ),
                                  SizedBox(height: 5.h),
                                  Text(
                                    "$weatherdata",
                                    //  +
                                    //     " (${homepageController.weatherResponseModel.weather![index].description!})",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
