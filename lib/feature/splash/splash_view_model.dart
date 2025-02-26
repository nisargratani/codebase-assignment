import 'dart:async';

import 'package:codebase_assignment/app/app.dart';
import 'package:codebase_assignment/app/navigation/routes.dart';
import 'package:codebase_assignment/base/base_view_model.dart';
import 'package:flutter/material.dart';

class SplashViewModel extends BaseViewModel {
  SplashViewModel() {
    startSplashProgress();
  }

  void startSplashProgress() {
    Future.delayed(Duration(seconds: 1)).then(
      (value) {
        Navigator.pushReplacementNamed(
            appLevelKey.currentContext!, RoutePaths.userList);
      },
    );
  }
}
