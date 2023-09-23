// ignore_for_file: deprecated_member_use

import 'package:dikitis_web/app/modules/email_verification/controllers/email_verification_controller.dart';
import 'package:get/get.dart';

class EmailVerificationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmailVerificationController>(
        () => EmailVerificationController());
  }
}
