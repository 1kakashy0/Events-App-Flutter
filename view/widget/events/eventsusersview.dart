/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:event_project/core/constant/colors.dart';
// import 'package:event_project/linkapi.dart';
// import 'package:flutter/material.dart';

// class CustomEventsUsersList extends StatelessWidget {
//   final String name;
//   final String price;
//   final String imageName;
//   final String status;
//   final String location;
//   final void Function()? onEdit;
//   final void Function()? onRemove;

//   const CustomEventsUsersList({
//     super.key,
//     required this.name,
//     required this.price,
//     required this.imageName,
//     required this.status,
//     this.onEdit,
//     this.onRemove, required this.location,
//   });

//   @override
//   Widget build(BuildContext context) {
//     Color statusColor;
//     IconData statusIcon;
//     String statusText;

//     switch (status) {
//       case "Approved":
//         statusColor = Colors.green;
//         statusIcon = Icons.check_circle;
//         statusText = "Approved";
//         break;
//       case "Refused":
//         statusColor = Colors.red;
//         statusIcon = Icons.cancel;
//         statusText = "Refused";
//         break;
//       default:
//         statusColor = Colors.orange;
//         statusIcon = Icons.hourglass_empty;
//         statusText = "Pending";
//     }

//     return Card(
//       margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//       elevation: 8,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: Container(
//         height: 200,
//         child: Stack(
//           children: [
//             // Event Image covering the entire card
//             ClipRRect(
//               borderRadius: BorderRadius.circular(15),
//               child: CachedNetworkImage(
//                 imageUrl: "${AppLink.imageEvents}/$imageName",
//                 width: double.infinity,
//                 height: double.infinity,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             // Gradient overlay for text readability
//             Positioned.fill(
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   gradient: LinearGradient(
//                     begin: Alignment.bottomCenter,
//                     end: Alignment.topCenter,
//                     colors: [
//                       Colors.black.withOpacity(0.6),
//                       Colors.transparent,
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             // Status Icon and Text
//             Positioned(
//               top: 10,
//               left: 15,
//               child: Row(
//                 children: [
//                   Icon(
//                     statusIcon,
//                     color: statusColor,
//                     size: 25,
//                   ),
//                   SizedBox(width: 8),
//                   Text(
//                     statusText,
//                     style: TextStyle(
//                       color: statusColor,
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             // Event Details and Action Buttons
//             Positioned(
//               bottom: 15,
//               left: 15,
//               right: 15,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         name,
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                           shadows: [
//                             Shadow(
//                               blurRadius: 3,
//                               color: Colors.black26,
//                               offset: Offset(0, 2),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: 5),
//                       Container(
//                         // color: Colors.grey,
//                         child: Text(
//                           "$price TND",
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: Appcolor.pink,
//                             shadows: [
//                               Shadow(
//                                 blurRadius: 3,
//                                 color: Colors.black26,
//                                 offset: Offset(0, 2),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             Positioned(
//               top: 10,
//               right: 15,
//               child: Column(
//                     children: [
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.white24,
//                           shape: CircleBorder(),
//                           padding: EdgeInsets.all(1),
//                         ),
//                         onPressed: onEdit,
//                         child: Icon(Icons.edit, color: Colors.white),
//                       ),
//                       SizedBox(width: 10),
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.redAccent,
//                           shape: CircleBorder(),
//                           padding: EdgeInsets.all(1),
//                         ),
//                         onPressed: onRemove,
//                         child: Icon(Icons.delete, color: Colors.white),
//                       ),
//                     ],
//                   ),)
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:cached_network_image/cached_network_image.dart';
import 'package:event_project/core/constant/colors.dart';
import 'package:event_project/linkapi.dart';
import 'package:flutter/material.dart';

class CustomEventsUsersList extends StatelessWidget {
  final String name;
  final String price;
  final String imageName;
  final String status;
  final String location;
  final void Function()? onEdit;
  final void Function()? onRemove;

  const CustomEventsUsersList({
    super.key,
    required this.name,
    required this.price,
    required this.imageName,
    required this.status,
    required this.location,
    this.onEdit,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    IconData statusIcon;
    String statusText;

    switch (status) {
      case "Approved":
        statusColor = Colors.green;
        statusIcon = Icons.check_circle;
        statusText = "Approved";
        break;
      case "Refused":
        statusColor = Colors.red;
        statusIcon = Icons.cancel;
        statusText = "Refused";
        break;
      default:
        statusColor = Colors.orange;
        statusIcon = Icons.hourglass_empty;
        statusText = "Pending";
    }

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        height: 200,
        child: Stack(
          children: [
            // Event Image covering the entire card
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl: "${AppLink.imageEvents}/$imageName",
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            // Gradient overlay for text readability
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.6),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            // Status Icon and Text
            Positioned(
              top: 10,
              left: 15,
              child: Container(
                color: Colors.black45,
                child: Row(
                  children: [
                    Icon(
                      statusIcon,
                      color: statusColor,
                      size: 25,
                    ),
                    SizedBox(width: 8),
                    Text(
                      statusText,
                      style: TextStyle(
                        color: statusColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Event Details and Action Buttons
            Positioned(
              bottom: 10,
              left: 15,
              right: 15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              blurRadius: 3,
                              color: Colors.black26,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(height: 5),
                      // Row(
                      //   children: [
                      //     Icon(Icons.location_on_outlined , color: Colors.white70,),
                      //     SizedBox(width: 3,),  // Spacing between icons
                      //     Text(
                      //       location,
                      //       style: TextStyle(
                      //         fontSize: 14,
                      //         color: Colors.white70,
                      //         shadows: [
                      //           Shadow(
                      //             blurRadius: 3,
                      //             color: Colors.black26,
                      //             offset: Offset(0, 2),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(height: 5),
                      Container(
                        color: Colors.black45,
                        child: Text(
                          "$price TND",
                          style: TextStyle(
                            fontSize: 16,
                            color: Appcolor.pink,
                            shadows: [
                              Shadow(
                                blurRadius: 3,
                                color: Colors.black26,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 10,
              right: 15,
              child: Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white24,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(1),
                    ),
                    onPressed: onEdit,
                    child: Icon(Icons.edit, color: Colors.white),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(1),
                    ),
                    onPressed: onRemove,
                    child: Icon(Icons.delete, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

