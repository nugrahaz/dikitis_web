import 'package:dikitis_web/app/constants/constants.dart';
import 'package:dikitis_web/app/services/local/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteGuard extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return StorageServices().getUserLogged() == false
        ? const RouteSettings(name: AppRoutes.authenticationScreen)
        : null;
  }
}
