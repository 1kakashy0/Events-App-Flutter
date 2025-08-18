/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:event_project/bindings/initialbinding.dart';
import 'package:event_project/controller/network_controller.dart';
import 'package:event_project/core/localization/translation.dart';
import 'package:event_project/core/services/services.dart';
import 'package:event_project/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/localization/changelocal.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => MyServices().init()); //injection lel services houni besh tethal toul maa l appli
  runApp(const MyApp());
  Get.put<NetworkController>(NetworkController(),permanent:true);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(
        LocaleController()); //injection fl main besh najmou nousloulha mn ay blasa

    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: controller.language,
      theme: controller.apptheme,
      initialBinding: InitialBinding(),
      getPages: routes,
    );
  }
}
