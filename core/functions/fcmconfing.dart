/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

// import 'package:get/get.dart';

requestPermissionNotification() async {
  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

fcmconfig() {
  var ringtonePlayer = FlutterRingtonePlayer();
  print("hai =======================================================");
  FirebaseMessaging.onMessage.listen((message) {
    print("================== Notification =================");
    print(message.notification!.title);
    print(message.notification!.body);
    ringtonePlayer.playNotification();
    Get.snackbar(message.notification!.title!, message.notification!.body!);
    // refreshPageNotification(message.data);
  });
}

// // refreshPageNotification(data) {
// //   print("============================= page id ");
// //   print(data['pageid']);
// //   print("============================= page name ");
// //   print(data['pagename']);
// //   print("================== Current Route");
// //   print(Get.currentRoute);

// //   if (Get.currentRoute == "/orderspending" &&
// //       data['pagename'] == "refreshorderpending") {
// //     OrdersPendingController controller = Get.find();
// //     controller.refrehOrder();
// //   }
// // }


// // // Firebase + stream 
// // // Socket io 
// // // Notification refresh 