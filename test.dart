/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

// import 'package:event_project/controller/test_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:qr_flutter/qr_flutter.dart';

// class QRCodeScreen extends StatelessWidget {
//   final QRCodeController qrCodeController = Get.put(QRCodeController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('QR Codes'),
//       ),
//       body: Obx(
//         () => ListView.builder(
//           itemCount: qrCodeController.qrCodes.length,
//           itemBuilder: (context, index) {
//             final qrCodeData = qrCodeController.qrCodes[index];
//             return Card(
//               child: Column(
//                 children: [
//                   QrImageView(
//                     data: "cart_id=${qrCodeData.cartId}&cart_usersid=${qrCodeData.cartUsersId}&cart_eventsid=${qrCodeData.cartEventsId}&cart_orders=${qrCodeData.cartOrders}",
//                     version: QrVersions.auto,
//                     size: 200.0,
//                   ),
//                   Text('Cart ID: ${qrCodeData.cartId}'),
//                   Text('User ID: ${qrCodeData.cartUsersId}'),
//                   Text('Event ID: ${qrCodeData.cartEventsId}'),
//                   Text('Orders: ${qrCodeData.cartOrders}'),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }