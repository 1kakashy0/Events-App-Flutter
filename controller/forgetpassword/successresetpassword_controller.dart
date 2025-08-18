/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:event_project/core/constant/routesnames.dart';
import 'package:get/get.dart';

abstract class SuccessResetPasswordController extends GetxController {

goToPageLogin();
}

class SuccessResetPasswordControllerImp extends SuccessResetPasswordController{
  @override
  void goToPageLogin() {
    Get.offAllNamed(AppRoute.login);
  }
}