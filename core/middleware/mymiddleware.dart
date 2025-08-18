/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:event_project/core/constant/routesnames.dart';
import 'package:event_project/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMiddleWare extends GetMiddleware{

  @override
  int? get priority => 1;

  MyServices myservices = Get.find(); //sayra injection myservices fl main deja 

  @override
  RouteSettings? redirect(String? route){
    if(myservices.sharedpreferences.getString("step") == "2"){
      return const RouteSettings(name: AppRoute.homepage);
    }
    if(myservices.sharedpreferences.getString("step") == "1"){
      return const RouteSettings(name: AppRoute.login);
    }
    return null;
  }
}

// 3malna setstring fl onboartding_controller w getstring fel mymiddleware.dart
//middleware besh maadesh tokhrej onboarding page w languages page lel 3abd eli dkhal lel aapli kbal 
//w 3ayetnelha fl routes.dart