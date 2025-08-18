/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:event_project/core/constant/apptheme.dart';
import 'package:event_project/core/functions/fcmconfing.dart';
import 'package:event_project/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController{

Locale? language ;

MyServices myServices = Get.find();

ThemeData apptheme = themeEnglish ;

changeLang(String langcode){
  Locale locale =Locale(langcode);
  myServices.sharedpreferences.setString("lang", langcode);
  apptheme = langcode == "ar" ? themeArabic : themeEnglish ;
  Get.changeTheme(apptheme);
  Get.updateLocale(locale);
  
}

  requestPerLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar("تنبيه", "الرجاء تشغيل خدمو تحديد الموقع");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar("تنبيه", "الرجاء اعطاء صلاحية الموقع للتطبيق");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Get.snackbar("تنبيه", "لا يمكن استعمال التطبيق من دون اللوكيشين");
    }
  }

@override
  void onInit() {
    requestPermissionNotification();
    fcmconfig();
    requestPerLocation();
    String? sharedPreflang = myServices.sharedpreferences.getString("lang");
    if (sharedPreflang == "ar") {
      language = const Locale("ar");
      apptheme = themeArabic ;
    }else if (sharedPreflang == "en"){
      language = const Locale("en");
      apptheme = themeEnglish ;
    }else if (sharedPreflang == "fr"){
      language = const Locale("fr");
      apptheme = themeFrench ;
    }else {
      language = Locale(Get.deviceLocale!.languageCode);
      apptheme = themeEnglish ;
    }
    super.onInit();
  }


}

//hounii behs n7elou l app b loughet el tel w nkhaliwha mara barka tsir lahkey bl sharedpreferences