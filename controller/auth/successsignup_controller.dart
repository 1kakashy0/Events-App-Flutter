/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:event_project/core/constant/routesnames.dart';
import 'package:get/get.dart';

abstract class SuccessSignUpController extends GetxController {

goToPageLogin();
}

class SuccessSignUpControllerImp extends SuccessSignUpController{
  @override
  void goToPageLogin() {
    Get.offAllNamed(AppRoute.login);
  }
}