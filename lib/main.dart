import 'package:dikitis_web/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/constants/routes/route_config.dart';
import 'app/utils/utils.dart';

void main() async {
  await init();
  runApp(App());
  //remove hash (url web)
  urlConfig();
}

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  WidgetsBinding.instance.addPostFrameCallback((_) {
    SizeConfig().init(Get.context!);
  });
  // ControllerBinding().dependencies();
}
