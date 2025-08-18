/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

initialServices() {
  // Get.putAsync(() => MyServices().init());   //aamalna function besh naamlou beha injection fl main yekhy ma9rrahesh .. soo aadineha toul
}

class MyServices extends GetxService {

  late SharedPreferences sharedpreferences ;

  Future<MyServices> init() async {
    await Firebase.initializeApp(
  options: const FirebaseOptions(
    apiKey: '',
    appId: '',
    messagingSenderId: '',
    projectId: '',
  ),
);
  sharedpreferences =  await SharedPreferences.getInstance();
  return this ;
  }

}



