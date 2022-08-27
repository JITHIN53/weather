
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'colors.dart';

class DefaultDialog {
  static void showLoading([String? message]) {
    Get.dialog(
      Dialog(
        backgroundColor: AppColors.pRIMARYCOLOR,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(
                color: AppColors.bluewhit,
              ),
              SizedBox(height: 8),
              Text(
                message ?? 'Loading...',
                style: TextStyle(color: AppColors.bluewhit),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //hide loading
  static void hideLoading() {
    if (Get.isDialogOpen!) Get.back();
  }
}
