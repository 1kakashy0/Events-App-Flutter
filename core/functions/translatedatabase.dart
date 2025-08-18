/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:event_project/core/services/services.dart';
import 'package:get/get.dart';

translateDataBase(columnar , columnen , columnfr){
  MyServices myServices = Get.find();

  if (myServices.sharedpreferences.getString("lang") == "ar"){
    return columnar ;
  }else if (myServices.sharedpreferences.getString("lang") == "en"){
    return columnen  ;
  }else if (myServices.sharedpreferences.getString("lang") == "fr"){
    return columnfr ;
  }
}