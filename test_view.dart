/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

// import 'package:event_project/controller/test_controller.dart';
// import 'package:event_project/core/class/statusrequest.dart';
// import 'package:event_project/core/constant/colors.dart';
// import 'package:event_project/core/constant/imageasset.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';

// class TestView extends StatelessWidget {
//   const TestView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Get.put(TestController());
//     return Scaffold(
//       backgroundColor: Appcolor.bkcolor,
//       appBar: AppBar(title:const  Text("test"),
//       backgroundColor: Appcolor.bkcolor,
//       ),
//       body: GetBuilder<TestController>(builder : (controller) {
//         if (controller.statusRequest ==  StatusRequest.loading){
//           return Center(child: Lottie.asset(Imageasset.loading ,  width: 150 , height: 100 ),);
//         }else if (controller.statusRequest == StatusRequest.offlinefailure){
//           return Center(child: Lottie.asset(Imageasset.offline , ),);
//         }else if (controller.statusRequest == StatusRequest.serverfailure){
//           return Center(child: Lottie.asset(Imageasset.serverfail ,  width: 150 , height: 100 ),);
//         }else if (controller.statusRequest == StatusRequest.failure){
//           return Center(child: Lottie.asset(Imageasset.nodata  ),);
//         }else{
//           return ListView.builder(
//             itemCount: controller.data.length,
//             itemBuilder: (context, index) {
//               return Text("${controller.data}");
//             },
//           );
//         }
//       },),
//     );
//   }
// }